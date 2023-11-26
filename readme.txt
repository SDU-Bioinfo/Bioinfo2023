Search Engine for Remote Homologous Proteins


Identifying proteins with similar structures in remote sequences is a difficult
undertaking. To address this issue, scientists have created a range of
techniques for executing remote homology searches. The aim of this project is
to create a deep learning-based algorithm that can identify up to 12 proteins
with similar structures from the Protein Data Bank (PDB) that are homologous to
a given protein sequence query.

The quality of the pairing between the query and the candidate proteins is
assessed by computing the TM-score and SEQID between the query structure and
the paired PDB structure using the TMalign program (normalized by the query
sequence length). The final score is determined as follows:

        (TM-score - 0.6) + min(0.4 - SEQID, 0).

The effectiveness of the algorithm is evaluated by summing the total score of
all the query-candidate pairs.


#### query.fasta ####

This input file contains 1024 protein sequences that are to be used as queries.
Your program should take the file (in the same format but with different data)
as input and return up to 12 proteins that are similar to each query sequence.


#### /data/pdb ####

This folder holds the Protein Data Bank of protein structures that can be
searched. The PDB files included can be accessed by a variety of Python
packages, including Graphein and BioPython.


#### tmalign.out ####

This training file has some potentially successful protein pairs with a
TM-score greater than 0.6 and a SEqID lower than 0.4.


#### result.out ####

This example output file has up to 12 potential proteins for each query
protein. Your program should generate output with the same format.


#### submission requirements ####

The final program should be submitted as a Docker (refer to docker directory).

