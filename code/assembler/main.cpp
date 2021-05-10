// assembler.c
//
// find type of instruction, assign bits and return machine code to main

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "assembler.h"

// instrucction type
typedef struct type{
    char *instName;
    char itype;
} type;

// associated code with instruction type
typedef struct ftype{
    char *instName;
    int fcode;
} ftype;

char findType(char* instruc) {
    type typeAry[33];

    // assigning values in array
    typeAry[0].instName  = "jr";    typeAry[0].itype  = 'r';
    typeAry[1].instName  = "jalr";  typeAry[1].itype  = 'r';
    typeAry[2].instName  = "mult";  typeAry[2].itype  = 'r';
    typeAry[3].instName  = "multu"; typeAry[3].itype  = 'r';
    typeAry[4].instName  = "div";   typeAry[4].itype  = 'r';
    typeAry[5].instName  = "divu";  typeAry[5].itype  = 'r';
    typeAry[6].instName  = "add";   typeAry[6].itype  = 'r';
    typeAry[7].instName  = "addu";  typeAry[7].itype  = 'r';
    typeAry[8].instName  = "sub";   typeAry[8].itype  = 'r';
    typeAry[9].instName  = "subu";  typeAry[9].itype  = 'r';
    typeAry[10].instName = "and";   typeAry[10].itype = 'r';
    typeAry[11].instName = "or";    typeAry[11].itype = 'r';
    typeAry[12].instName = "xor";   typeAry[12].itype = 'r';
    typeAry[13].instName = "nor";   typeAry[13].itype = 'r';
    typeAry[14].instName = "j";     typeAry[14].itype = 'j';
    typeAry[15].instName = "jal";   typeAry[15].itype = 'j';
    typeAry[16].instName = "beq";   typeAry[16].itype = 'i';
    typeAry[17].instName = "bne";   typeAry[17].itype = 'i';
    typeAry[18].instName = "blez";  typeAry[18].itype = 'i';
    typeAry[19].instName = "bgtz";  typeAry[19].itype = 'i';
    typeAry[20].instName = "addi";  typeAry[20].itype = 'i';
    typeAry[21].instName = "addiu"; typeAry[21].itype = 'i';
    typeAry[22].instName = "ori";   typeAry[22].itype = 'i';
    typeAry[23].instName = "xori";  typeAry[23].itype = 'i';
    typeAry[24].instName = "lui";   typeAry[24].itype = 'i';
    typeAry[25].instName = "lw";    typeAry[25].itype = 'i';
    typeAry[26].instName = "sw";    typeAry[26].itype = 'i';
    typeAry[27].instName = "andi";  typeAry[27].itype = 'i';
    typeAry[28].instName = "int";   typeAry[28].itype = 'd';
    typeAry[29].instName = "spd";   typeAry[29].itype = 'c';
    typeAry[30].instName = "rot";   typeAry[30].itype = 'c';
    typeAry[31].instName = "scn";   typeAry[31].itype = 'c';
    typeAry[32].instName = "fir";   typeAry[32].itype = 'c';

    int i = 0;

    // find type
    while((i < 33) && (strcmp(instruc, typeAry[i].instName) != 0))
        i++;

    return typeAry[i].itype;
}

// finds function code for r-type instructions
int findFC(char* instruc) {
    ftype fCodeAry[14];

    fCodeAry[0].instName  = "jr";    fCodeAry[0].fcode  = 8;
    fCodeAry[1].instName  = "jalr";  fCodeAry[1].fcode  = 9;
    fCodeAry[2].instName  = "mult";  fCodeAry[2].fcode  = 24;
    fCodeAry[3].instName  = "multu"; fCodeAry[3].fcode  = 25;
    fCodeAry[4].instName  = "div";   fCodeAry[4].fcode  = 26;
    fCodeAry[5].instName  = "divu";  fCodeAry[5].fcode  = 27;
    fCodeAry[6].instName  = "add";   fCodeAry[6].fcode  = 32;
    fCodeAry[7].instName  = "addu";  fCodeAry[7].fcode  = 33;
    fCodeAry[8].instName  = "sub";   fCodeAry[8].fcode  = 34;
    fCodeAry[9].instName  = "subu";  fCodeAry[9].fcode  = 35;
    fCodeAry[10].instName = "and";   fCodeAry[10].fcode = 36;
    fCodeAry[11].instName = "or";    fCodeAry[11].fcode = 37;
    fCodeAry[12].instName = "xor";   fCodeAry[12].fcode = 38;
    fCodeAry[13].instName = "nor";   fCodeAry[13].fcode = 39;

    int i = 0;
    while((i < 14) && (strcmp(instruc, fCodeAry[i].instName) != 0))
        i++;

    // instruction not in this set
    if( i > 14)
        printf("Index exceded in findFC");

    return fCodeAry[i].fcode;
}

// shift bits into proper position
// opcode rs rt rd func
int rType(char* instruc, int regd, int regs, int regt) {
    int finalCode;
    int funcCode = findFC(instruc);            // always > 0

    regs = regs << 21;
    regt = regt << 16;
    regd = regd << 11;

    finalCode = regs | regt | regd | funcCode; // create machine code
    return finalCode;
}

// i-type
// opcode rd rt imm
int iType(char* instruc, int regt, int regs, char* imm, brkpnts* labels,
          int lineptr) {
    ftype opAry[12];

    opAry[0].instName  = "beq";   opAry[0].fcode  = 4;
    opAry[1].instName  = "bne";   opAry[1].fcode  = 5;
    opAry[2].instName  = "blez";  opAry[2].fcode  = 6;
    opAry[3].instName  = "bgtz";  opAry[3].fcode  = 7;
    opAry[4].instName  = "addi";  opAry[4].fcode  = 8;
    opAry[5].instName  = "addiu"; opAry[5].fcode  = 9;
    opAry[6].instName  = "andi";  opAry[6].fcode  = 12;
    opAry[7].instName  = "ori";   opAry[7].fcode  = 13;
    opAry[8].instName  = "xori";  opAry[8].fcode  = 14;
    opAry[9].instName  = "lui";   opAry[9].fcode  = 15;
    opAry[10].instName = "lw";    opAry[10].fcode = 35;
    opAry[11].instName = "sw";    opAry[11].fcode = 43;

    int opcode;
    int immDec;
    int i = 0;
    int finalCode;

    // find opcode
    while((i < 12) && (strcmp(instruc, opAry[i].instName) != 0 ))
        i++;

    // assign
    if(i < 12)
        opcode = opAry[i].fcode;
    else
        printf("Index exceded in iType");

    opcode = opcode << 26;
    regs = regs << 21;
    regt = regt << 16;

    // check if imm is a label
    int j = 0;
    while((j < labels->size) && (strcmp(imm, labels->keywords[j].name) != 0))
        j++;

    if(j >= labels->size) {         // imm is not a label
        sscanf(imm, "%i", &immDec);
    }
    else {                          // imm is a label
        if(strcmp(instruc, "lw") == 0 || strcmp(instruc, "sw") == 0)
            immDec = labels->keywords[j].lineNum * 4;       // diff from rest
        else
            immDec = labels->keywords[j].lineNum - lineptr; // branches
    }

    // make sure digits are consistent in immDec
    immDec = immDec & 0x0000ffff;

    finalCode = opcode | regs | regt | immDec;
    return finalCode;
}

// j-type
// opcode addr
int jType(char* instruc, char* address, brkpnts* labels) {
    int opcode;
    int addrcode;
    int finalCode;
    int j = 0;

    if(strcmp(instruc, "j") == 0)
        opcode = 2;
    else
        opcode = 3;

    opcode = opcode << 26;

    // checking if address is a label
    while((j < labels->size) &&
          (strcmp(address, labels->keywords[j].name) != 0)) {
        // printf("%s %s %d\n", address, labels->keywords[j].name, j);
        j++;
    }

    if(j >= labels->size) {         // not a label
        sscanf(address, "%i", &addrcode);
    }
    else {                          // is a label
        addrcode = labels->keywords[j].lineNum;
    }

    finalCode = opcode | addrcode;
    return finalCode;
}

// drops the $ from the register prefix
char* registerConv(char* token) {
    int strlgth = strlen(token);

    char* newReg;
    newReg = (char*)malloc(strlgth * sizeof(char));

    // char newReg[strlgth];

    int i = 0;
    while(i < strlgth) {
        newReg[i] = token[i + 1];
        i++;
    }

    token = newReg;
    return token;
}

// additional handling for custom c-type instructions
int cType(char* instruc, int regd, char* imm, brkpnts* labels, int lineptr) {
    int opcode = 19;
    int cfn;
    int immDec;
    int finalCode;

    if(strcmp(instruc, "spd") == 0)
        cfn = 0;
    else if(strcmp(instruc, "rot") == 0)
        cfn = 1;
    else if(strcmp(instruc, "scn") == 0)
        cfn = 2;
    else
        cfn = 3;

    opcode = opcode << 26;
    cfn    = cfn    << 21;
    regd   = regd   << 16;

    // assuming that immediate value is always an integer
    sscanf(imm, "%i", &immDec);
    immDec = immDec & 0x0000ffff;

    finalCode = opcode | cfn | regd | immDec;
    return finalCode;
}

// function to determine if a token is a label
int isLabel(brkpnts* labels, char* imm) {
    int j = 0;

    // searching for match
    while((j < labels->size) && (strcmp(imm, labels->keywords[j].name) != 0))
        j++;

    if(j >= labels->size)
        return 0;

    else
        return 1;
}
