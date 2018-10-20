/**
*	Codigo	de	Programmers	BlockChain	(https://medium.com/programmers-blockchain)
*	Modificado	por:	 	Marly Piedrahita (mj.piedrahita)
*						Juan Méndez (jc.mendez)
*/
package noobchain;

import java.security.Security;
import java.util.ArrayList;
//import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class NoobChain {
	
	public static HashMap<String, TransactionOutput> UTXOs;


	public static float minimumTransaction = 0.1f;



	public static void main(String[] args) {
		// add our blocks to the blockchain ArrayList:
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider()); // Setup Bouncey castle as a
																				// Security Provider
		
		int iterations = 10;
			
		int minDifficulty = 2;
		int maxDifficulty = 8;
		
		List<String> results = new ArrayList<String>();
		
		for (int difficulty = minDifficulty; difficulty < maxDifficulty; difficulty++) {
			for (int i = 0; i < iterations; i++) {
				long startTime = System.nanoTime();
				computeBlockchain(difficulty);
				long endTime = System.nanoTime();
				long duration = (endTime - startTime);  //divide by 1000000 to get milliseconds.
				long durationInMilis = duration / 1000000;
				results.add(String.format("difficulty=%s;iteration=%s;%s", difficulty, i , durationInMilis)   );
			}
		}
		
		
		
		for (String r : results) {
			System.out.println(r);
		}
		
		
		
	}
	
	
	public static void computeBlockchain(int difficulty) {
		UTXOs = new HashMap<String, TransactionOutput>();
		
		ArrayList<Block> blockchain = new ArrayList<Block>();
		
		
		
		// Create wallets:
		Wallet walletA = new Wallet();
		Wallet walletB = new Wallet();
		Wallet walletC = new Wallet();
		Wallet coinbase = new Wallet();

		// create genesis transaction, which sends 100 NoobCoin to walletA:
		Transaction genesisTransaction = new Transaction(coinbase.publicKey, walletA.publicKey, 100f, null);
		genesisTransaction.generateSignature(coinbase.privateKey); // manually sign the genesis transaction
		genesisTransaction.transactionId = "0"; // manually set the transaction id
		genesisTransaction.outputs.add(new TransactionOutput(genesisTransaction.reciepient, genesisTransaction.value,
				genesisTransaction.transactionId)); // manually add the Transactions Output
		UTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0)); // its important to store
																							// our first transaction in
																							// the UTXOs list.

		System.out.println("Creating and Mining Genesis block... ");
		Block genesis = new Block("0");
		genesis.addTransaction(genesisTransaction);
		addBlock(genesis, difficulty, blockchain);

		// testing
		Block block1 = new Block(genesis.hash);
		System.out.println("\nWalletA's balance is: " + walletA.getBalance());
		System.out.println("\nWalletA is Attempting to send funds (40) to WalletB...");
		block1.addTransaction(walletA.sendFunds(walletB.publicKey, 40f));
		addBlock(block1, difficulty, blockchain);
		System.out.println("blockchain size: "+ blockchain.size());
		System.out.println("\nWalletA's balance is: " + walletA.getBalance());
		System.out.println("WalletB's balance is: " + walletB.getBalance());

		Block block2 = new Block(block1.hash);
		System.out.println("\nWalletA Attempting to send more funds (1000) than it has...");
		block2.addTransaction(walletA.sendFunds(walletB.publicKey, 1000f));
		addBlock(block2, difficulty, blockchain);
		System.out.println("blockchain size: "+ blockchain.size());
		System.out.println("\nWalletA's balance is: " + walletA.getBalance());
		System.out.println("WalletB's balance is: " + walletB.getBalance());

		System.out.println("*******************");
		Block block3 = new Block(block2.hash);
		System.out.println("\nWalletB is Attempting to send funds (20) to WalletA...");
		block3.addTransaction(walletB.sendFunds(walletA.publicKey, 20));
		addBlock(block3, difficulty, blockchain);
		System.out.println("\nWalletA's balance is: " + walletA.getBalance());
		System.out.println("WalletB's balance is: " + walletB.getBalance());
		System.out.println("*******************");
		
		System.out.println("blockchain size: "+ blockchain.size());
		
		// Adicione una transacción nueva: el usuario A envía al usuario C, 20 coins. Verifique el resultado.
		System.out.println("******************************************************");
		System.out.println("        el usuario A envía al usuario C, 20 coins");
		System.out.println("******************************************************");
		Block block4 = new Block(block3.hash);
		System.out.println("\nWalletA's balance is: " + walletA.getBalance());
		System.out.println("\nWalletA is Attempting to send funds (20) to WalletB...");
		block4.addTransaction(walletA.sendFunds(walletC.publicKey, 20f));
		addBlock(block4, difficulty, blockchain);
		System.out.println("\nWalletA's balance is: " + walletA.getBalance());
		System.out.println("WalletC's balance is: " + walletC.getBalance());
		System.out.println("blockchain size: "+ blockchain.size());
		System.out.println("******************************************************");

		isChainValid(difficulty,  genesisTransaction, blockchain);
	}
	

	public static Boolean isChainValid(int difficulty, Transaction genesisTransaction, ArrayList<Block> blockchain ) {
		Block currentBlock;
		Block previousBlock;
		String hashTarget = new String(new char[difficulty]).replace('\0', '0');
		HashMap<String, TransactionOutput> tempUTXOs = new HashMap<String, TransactionOutput>(); // a temporary working
																									// list of unspent
																									// transactions at a
																									// given block
																									// state.
		tempUTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));

		// loop through blockchain to check hashes:
		for (int i = 1; i < blockchain.size(); i++) {

			currentBlock = blockchain.get(i);
			previousBlock = blockchain.get(i - 1);
			// compare registered hash and calculated hash:
			if (!currentBlock.hash.equals(currentBlock.calculateHash())) {
				System.out.println("#Current Hashes not equal");
				return false;
			}
			// compare previous hash and registered previous hash
			if (!previousBlock.hash.equals(currentBlock.previousHash)) {
				System.out.println("#Previous Hashes not equal");
				return false;
			}
			// check if hash is solved
			if (!currentBlock.hash.substring(0, difficulty).equals(hashTarget)) {
				System.out.println("#This block hasn't been mined");
				return false;
			}

			// loop thru blockchains transactions:
			TransactionOutput tempOutput;
			for (int t = 0; t < currentBlock.transactions.size(); t++) {
				Transaction currentTransaction = currentBlock.transactions.get(t);

				if (!currentTransaction.verifySignature()) {
					System.out.println("#Signature on Transaction(" + t + ") is Invalid");
					return false;
				}
				if (currentTransaction.getInputsValue() != currentTransaction.getOutputsValue()) {
					System.out.println("#Inputs are note equal to outputs on Transaction(" + t + ")");
					return false;
				}

				for (TransactionInput input : currentTransaction.inputs) {
					tempOutput = tempUTXOs.get(input.transactionOutputId);

					if (tempOutput == null) {
						System.out.println("#Referenced input on Transaction(" + t + ") is Missing");
						return false;
					}

					if (input.UTXO.value != tempOutput.value) {
						System.out.println("#Referenced input Transaction(" + t + ") value is Invalid");
						return false;
					}

					tempUTXOs.remove(input.transactionOutputId);
				}

				for (TransactionOutput output : currentTransaction.outputs) {
					tempUTXOs.put(output.id, output);
				}

				if (currentTransaction.outputs.get(0).reciepient != currentTransaction.reciepient) {
					System.out.println("#Transaction(" + t + ") output reciepient is not who it should be");
					return false;
				}
				if (currentTransaction.outputs.get(1).reciepient != currentTransaction.sender) {
					System.out.println("#Transaction(" + t + ") output 'change' is not sender.");
					return false;
				}

			}

		}
		System.out.println("Blockchain is valid");
		return true;
	}

	public static void addBlock(Block newBlock, int difficulty, ArrayList<Block> blockchain ) {
		newBlock.mineBlock(difficulty);
		blockchain.add(newBlock);
	}
}

/*
 * public static void main(String[] args) { //add our blocks to the blockchain
 * ArrayList: Security.addProvider(new
 * org.bouncycastle.jce.provider.BouncyCastleProvider()); //Setup Bouncey castle
 * as a Security Provider
 * 
 * //walletA = new Wallet(); //walletB = new Wallet();
 * 
 * //System.out.println("Private and public keys:");
 * //System.out.println(StringUtil.getStringFromKey(walletA.privateKey));
 * //System.out.println(StringUtil.getStringFromKey(walletA.publicKey));
 * 
 * createGenesis();
 * 
 * //Transaction transaction = new Transaction(walletA.publicKey,
 * walletB.publicKey, 5); //transaction.signature =
 * transaction.generateSignature(walletA.privateKey);
 * 
 * //System.out.println("Is signature verified:");
 * //System.out.println(transaction.verifiySignature());
 * 
 * }
 */

// System.out.println("Trying to Mine block 1... ");
// addBlock(new Block("Hi im the first block", "0"));
