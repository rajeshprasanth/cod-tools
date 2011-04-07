/*---------------------------------------------------------------------------*\
**$Author$
**$Date$ 
**$Revision$
**$URL$
\*---------------------------------------------------------------------------*/

#ifndef __CIF_H
#define __CIF_H

#include <stdlib.h>
#include <stdarg.h>
#include <cexceptions.h>

typedef struct CIF CIF;

typedef enum {
  CIF_OK = 0,
  CIF_UNRECOVERABLE_ERROR,
  CIF_COMPILATION_ERROR,

  last_CIF_ERROR
} cif_error_t;

extern void *cif_subsystem;

void cif_debug_on( void );
void cif_debug_off( void );
int cif_debug_is_on( void );

CIF *new_cif( cexception_t *ex );

void delete_cif( CIF *bc );

void create_cif( CIF * volatile *cif, cexception_t *ex );

void dispose_cif( CIF * volatile *cif );

void cif_dump( CIF * volatile cif );

void cif_insert_value( CIF * cif, char *tag, char *value,
                       cexception_t *ex );

#endif
