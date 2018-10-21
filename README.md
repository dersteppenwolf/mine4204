# MINE 4204 – Información, Seguridad y Privacidad

    
Uniandes Departamento de Ingeniería de Sistemas y Computación 

Curso: MINE 4204 Información, Seguridad y Privacidad

Semestre 2018-2

    Marly Piedrahita (mj.piedrahita)
    Juan Méndez (jc.mendez)

## Laboratorio – BlockChain

**Código**

Código fuente: [/blockchain](../master/blockchain)


**Preparación:**

Siga el tutorial “Creating your first blockchain with Java.” Partes 1 y 2: 

https://medium.com/programmers-blockchain/create-simple-blockchain-java-tutorial-from-scratch-6eeed3cb03fa  

https://medium.com/programmers-blockchain/creating-your-first-blockchain-with-java-part-2-transactions-2cdac335e0ce

Tenga en cuenta:
- Este programa permite crear una aproximación de una aplicación basada en BlockChain. Sin
embargo, dicha aplicación tiene limitaciones (no es para uso en ambientes profesionales o de
negocios).
- Revise que el programa final funciona como se espera (en el tutorial le indican qué salida esperar).
- Use las librerías de BouncyCastle publicadas en el SICUA+.


**Actividades:**

Adicione un directorio docs al proyecto Java y cree un archivo con las respuestas a las siguientes preguntas:
- ¿Qué algoritmo usa el programa para manejo de criptografía asimétrica?
- ¿Qué algoritmo usa el programa para firmar una transacción? ¿Cuál es la diferencia con el
algoritmo mencionado en el punto anterior?
- En el tutorial se indica que verificar una transacción puede tomar mucho tiempo porque es
necesario revisar las entradas. Explique más detalladamente el significado de esta afirmación.
- Adicione una transacción nueva: el usuario A envía al usuario C, 20 coins. Verifique el resultado.
- Cree una tabla que muestre el cambio en el número de intentos y tiempo necesario para minar
usando las siguientes dificultades: 2, 3, 4, 5, 6, 7. Adicionalmente cree una gráfica que ilustre los incrementos.


**Entrega:**

Cada grupo debe adicionar la siguiente línea al comienzo del archivo Java principal: 

    /*
    * Codigo de Programmers BlockChain (https://medium.com/programmers-blockchain) * Modificado por: <nombres de todos los integrantes del grupo>
    */

Y entregar un zip del proyecto Java completo (incluyendo el directorio doc con el informe) en SICUA+, de acuerdo con las condiciones establecidas.
