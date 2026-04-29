(*
    Type: History
    Purpose:
    Stores production state snapshot for later transfer to SCADA / SQL.

    Note:
    This is an anonymized version of the original structure.
*)

TYPE History :
STRUCT
    NotTransferred_Server1 : BOOL;
    NotTransferred_Server2 : BOOL;
    NotTransferred_Server3 : BOOL;
    NotTransferred_Server4 : BOOL;

    ShiftNumber   : WORD;
    OrderNumber   : DWORD;

    InputCounter  : DWORD;
    OutputCounter : DWORD;
    RejectCounter : DWORD;

    Year          : WORD;
    Month         : WORD;
    Day           : WORD;
    Hour          : WORD;
    Minute        : WORD;
    Second        : WORD;

    StatusWord    : WORD;
    StatusWord2   : WORD;

    UserNumber    : WORD;
    SetupType     : WORD;
END_STRUCT
END_TYPE
