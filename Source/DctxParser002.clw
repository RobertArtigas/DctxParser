

   MEMBER('DctxParser.clw')                                ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('DCTXPARSER002.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
ParseDctxFile PROCEDURE 

st              StringTheory
DctxFilename         STRING(255)                           ! 
DictionaryQ          GROUP,PRE(Dct),NAME('dictionary')     ! 
DctNameG             GROUP,PRE()                           ! 
Name                 STRING(30),NAME('name')               ! 
Version              STRING(10),NAME('version')            ! 
DctxFormat           STRING(10),NAME('dctxformat')         ! 
                     END                                   ! 
                     END                                   ! 
RelationsQ           QUEUE,PRE(Relate),NAME('relation')    ! 
Guid                 STRING(38),NAME('guid')               ! 
PrimaryTable         STRING(38),NAME('primarytable')       ! 
ForeignTable         STRING(38),NAME('foreigntable')       ! 
PrimaryKey           STRING(38),NAME('primarykey')         ! 
ForeignKey           STRING(38),NAME('foreignkey')         ! 
                     END                                   ! 
KeysQ                QUEUE,PRE(Keys),NAME('key')           ! 
Guid                 STRING(38),NAME('guid')               ! 
Ident                STRING(20),NAME('ident')              ! 
Order                STRING(20),NAME('order')              ! 
Name                 STRING(30),NAME('name')               ! 
KeyType              STRING(20),NAME('keytype')            ! 
Unique               STRING(20),NAME('unique')             ! 
Primary              STRING(20),NAME('primary')            ! 
AutoNumber           STRING(20),NAME('autonumber')         ! 
Exclude              STRING(20),NAME('exclude')            ! 
                     END                                   ! 
FieldsQ              QUEUE,PRE(Flds),NAME('field')         ! 
Guid                 STRING(38),NAME('guid')               ! 
Ident                STRING(20),NAME('ident')              ! 
Name                 STRING(30),NAME('name')               ! 
DataType             STRING(20),NAME('datatype')           ! 
Size                 STRING(20),NAME('size')               ! 
ScreenPicture        STRING(20),NAME('screenpicture')      ! 
ScreenPrompt         STRING(20),NAME('screenprompt')       ! 
ReportHeading        STRING(30),NAME('reportheading')      ! 
Justification        STRING(20),NAME('justification')      ! 
Offset               STRING(20),NAME('offset')             ! 
ReportControl        STRING(50),NAME('reportcontrol')      ! 
                     END                                   ! 
TablesQ              QUEUE,PRE(Tables),NAME('tableq')      ! 
Guid                 STRING(38),NAME('guid')               ! 
Ident                STRING(20),NAME('ident')              ! 
Name                 STRING(50),NAME('name')               ! 
Prefix               STRING(20),NAME('prefix')             ! 
Driver               STRING(20),NAME('driver')             ! 
Create               STRING(20),NAME('create')             ! 
Thread               STRING(20),NAME('thread')             ! 
Bindable             STRING(20),NAME('bindable')           ! 
                     END                                   ! 
Window               WINDOW('Parse DCTX File'),AT(,,358,241),FONT('Segoe UI',9),AUTO,ICON('imageres_111.ico'),GRAY, |
  SYSTEM,IMM
                       BUTTON('Close'),AT(319,219),USE(?Close)
                       PROMPT('Dctx Filename:'),AT(3,9),USE(?DctxFilename:Prompt)
                       ENTRY(@s255),AT(64,8,273,10),USE(DctxFilename)
                       SHEET,AT(2,44,351,172),USE(?SHEET1)
                         TAB('Tables'),USE(?TAB1)
                           LIST,AT(9,63,335,144),USE(?LIST1),HVSCROLL,FORMAT('137L(2)|M~Guid~@s38@37L(2)|M~Ident~@' & |
  's20@79L(2)|M~Name~@s50@36L(2)|M~Prefix~@s20@52L(2)|M~Driver~@s20@35L(2)|M~Create~@s2' & |
  '0@36L(2)|M~Thread~@s20@80L(2)|M~Bindable~@s20@'),FROM(TablesQ)
                         END
                         TAB('Fields'),USE(?TAB2)
                           LIST,AT(9,63,335,144),USE(?LIST2),HVSCROLL,FORMAT('137L(2)|M~Guid~@s38@31L(2)|M~Ident~@' & |
  's20@72L(2)|M~Name~@s30@50L(2)|M~Data Type~@s20@40L(2)|M~Size~@s20@49L(2)|M~Screen Pi' & |
  'cture~@s20@54L(2)|M~Screen Prompt~@s20@70L(2)|M~Report Heading~@s30@44L(2)|M~Justifi' & |
  'cation~@s20@27L(2)|M~Offset~@s20@200L(2)|M~Report Control~@s50@'),FROM(FieldsQ)
                         END
                         TAB('Keys'),USE(?TAB3)
                           LIST,AT(9,63,335,144),USE(?LIST3),HVSCROLL,FORMAT('136L(2)|M~Guid~@s38@32L(2)|M~Ident~@' & |
  's20@38L(2)|M~Order~@s20@71L(2)|M~Name~@s30@40L(2)|M~Key Type~@s20@35L(2)|M~Unique~@s' & |
  '20@43L(2)|M~Primary~@s20@51L(2)|M~Auto Number~@s20@80L(2)|M~Exclude~@s20@'),FROM(KeysQ)
                         END
                         TAB('Relationships'),USE(?TAB4)
                           LIST,AT(9,63,335,144),USE(?LIST4),HVSCROLL,FORMAT('134L(2)|M~Guid~@s38@135L(2)|M~Primar' & |
  'y Table~@s38@136L(2)|M~Foreign Table~@s38@138L(2)|M~Primary Key~@s38@152L(2)|M~Forei' & |
  'gn Key~@s38@'),FROM(RelationsQ)
                         END
                       END
                       BUTTON('...'),AT(341,7,12,12),USE(?LookupFile)
                       BUTTON('Load'),AT(3,27),USE(?LoadXfilesBtn)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
! ----- TablesXml --------------------------------------------------------------------------
TablesXml            Class(xFileXML)
    ! derived method declarations
Constructor            PROCEDURE () ,VIRTUAL
Load                   PROCEDURE (*Queue p_Queue, *string p_String, long p_Length,string p_FileBoundary,string p_RecordBoundary), long, proc, virtual
AssignField            PROCEDURE (Long DataStartPos,Long DataEndPos),Long, virtual
AssignField            PROCEDURE (String pString), virtual
                     End  ! TablesXml
! ----- end TablesXml -----------------------------------------------------------------------
! ----- FieldsXml --------------------------------------------------------------------------
FieldsXml            Class(xFileXML)
    ! derived method declarations
Constructor            PROCEDURE () ,VIRTUAL
                     End  ! FieldsXml
! ----- end FieldsXml -----------------------------------------------------------------------
! ----- KeysXml --------------------------------------------------------------------------
KeysXml              Class(xFileXML)
    ! derived method declarations
Constructor            PROCEDURE () ,VIRTUAL
                     End  ! KeysXml
! ----- end KeysXml -----------------------------------------------------------------------
! ----- RelateXml --------------------------------------------------------------------------
RelateXml            Class(xFileXML)
    ! derived method declarations
Constructor            PROCEDURE () ,VIRTUAL
                     End  ! RelateXml
! ----- end RelateXml -----------------------------------------------------------------------
! ----- DctXml --------------------------------------------------------------------------
DctXml               Class(xFileXML)
    ! derived method declarations
Constructor            PROCEDURE () ,VIRTUAL
Load                   PROCEDURE (*Group p_Group, string p_FileName,string p_FileBoundary,string p_RecordBoundary), long, proc, virtual
Load                   PROCEDURE (*Group p_Group, *string p_String, long p_Length), long, proc, virtual
Load                   PROCEDURE (*Group p_Group, *string p_String, long p_Length,string p_FileBoundary,string p_RecordBoundary), long, proc, virtual
Load                   PROCEDURE (*Queue p_Queue, string p_FileName,string p_FileBoundary,string p_RecordBoundary),long,proc ,virtual
AssignField            PROCEDURE (String pString), virtual
ParseAttr              PROCEDURE (String pAttr), virtual
                     End  ! DctXml
! ----- end DctXml -----------------------------------------------------------------------
FileLookup4          SelectFileClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ParseDctxFile')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Close
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  ! Restore preserved local variables from non-volatile store
  DctxFilename = INIMgr.TryFetch('ParseDctxFile_PreservedVars','DctxFilename')
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ParseDctxFile',Window)                     ! Restore window settings from non-volatile store
  FileLookup4.Init
  FileLookup4.ClearOnCancel = True
  FileLookup4.Flags=BOR(FileLookup4.Flags,FILE:LongName)   ! Allow long filenames
  FileLookup4.SetMask('All Files','*.dctx')                ! Set the file mask
  FileLookup4.WindowTitle='''Select DCTX File'''
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('ParseDctxFile',Window)                  ! Save window data to non-volatile store
  END
  ! Save preserved local variables in non-volatile store
  INIMgr.Update('ParseDctxFile_PreservedVars','DctxFilename',DctxFilename)
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    OF ?LoadXfilesBtn
      !st.LoadFile(DctxFilename)
      
      Free(TablesQ)
      DctXml.start()
      DctXml.TagCase = XF:CaseAny
      DctXml.Load(TablesQ,DctxFilename,'Dictionary','Table')
      
      Free(RelationsQ)   
      RelateXml.start()
      RelateXml.TagCase = XF:CaseAny
      RelateXml.Load(RelationsQ,DctxFilename,'','Relation')      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LookupFile
      ThisWindow.Update()
      DctxFilename = FileLookup4.Ask(1)
      DISPLAY
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!----------------------------------------------------
TablesXml.Constructor   PROCEDURE ()
  CODE
  PARENT.Constructor ()
          self.SaveStringsAsCData = 0
          self.SaveMEMOsAsCData = 1
          self.SaveBLOBsAsCData = 1
          self._ReplaceColons = 1
          self.RemovePrefix = 1
          self.DontUseMemos = 0
          self.DontUseBLOBs = 0
    
    
          self.freeQueueBeforeLoad = 1
          self.freeGroupBeforeLoad = 0
          self.freeFileBeforeLoad = 0
          self.UpdateFileOnLoad = 0
    
!----------------------------------------------------
TablesXml.Load   PROCEDURE (*Queue p_Queue, *string p_String, long p_Length,string p_FileBoundary,string p_RecordBoundary)
ReturnValue   long
  CODE
    self.Trace('TablesXml.Load - p_FileBoundary = ' & p_FileBoundary & ' p_RecordBoundary = ' & p_RecordBoundary) 
  ReturnValue = PARENT.Load (p_Queue,p_String,p_Length,p_FileBoundary,p_RecordBoundary)
    Return ReturnValue
!----------------------------------------------------
TablesXml.AssignField   PROCEDURE (Long DataStartPos,Long DataEndPos)
ReturnValue   Long
  CODE
    self.Trace('    TablesXml.AssignField - DataStartPos = ' & DataStartPos & ' DataEndPos = ' & DataEndPos)
  ReturnValue = PARENT.AssignField (DataStartPos,DataEndPos)
    Return ReturnValue
!----------------------------------------------------
TablesXml.AssignField   PROCEDURE (String pString)
  CODE
    self.Trace('TablesXml.AssignField - self.CurrentField = ' & self.CurrentField & ' self.currentTag = ' & clip(self.currentTag)) 
  PARENT.AssignField (pString)
!----------------------------------------------------
FieldsXml.Constructor   PROCEDURE ()
  CODE
  PARENT.Constructor ()
          self.SaveStringsAsCData = 0
          self.SaveMEMOsAsCData = 1
          self.SaveBLOBsAsCData = 1
          self._ReplaceColons = 1
          self.RemovePrefix = 1
          self.DontUseMemos = 0
          self.DontUseBLOBs = 0
    
    
          self.freeQueueBeforeLoad = 1
          self.freeGroupBeforeLoad = 0
          self.freeFileBeforeLoad = 0
          self.UpdateFileOnLoad = 0
    
!----------------------------------------------------
KeysXml.Constructor   PROCEDURE ()
  CODE
  PARENT.Constructor ()
          self.SaveStringsAsCData = 0
          self.SaveMEMOsAsCData = 1
          self.SaveBLOBsAsCData = 1
          self._ReplaceColons = 1
          self.RemovePrefix = 1
          self.DontUseMemos = 0
          self.DontUseBLOBs = 0
    
    
          self.freeQueueBeforeLoad = 1
          self.freeGroupBeforeLoad = 0
          self.freeFileBeforeLoad = 0
          self.UpdateFileOnLoad = 0
    
!----------------------------------------------------
RelateXml.Constructor   PROCEDURE ()
  CODE
  PARENT.Constructor ()
          self.SaveStringsAsCData = 0
          self.SaveMEMOsAsCData = 1
          self.SaveBLOBsAsCData = 1
          self._ReplaceColons = 1
          self.RemovePrefix = 1
          self.DontUseMemos = 0
          self.DontUseBLOBs = 0
    
    
          self.freeQueueBeforeLoad = 1
          self.freeGroupBeforeLoad = 0
          self.freeFileBeforeLoad = 0
          self.UpdateFileOnLoad = 0
    
!----------------------------------------------------
DctXml.Constructor   PROCEDURE ()
  CODE
  PARENT.Constructor ()
          self.SaveStringsAsCData = 0
          self.SaveMEMOsAsCData = 1
          self.SaveBLOBsAsCData = 1
          self._ReplaceColons = 1
          self.RemovePrefix = 1
          self.DontUseMemos = 0
          self.DontUseBLOBs = 0
    
    
          self.freeQueueBeforeLoad = 1
          self.freeGroupBeforeLoad = 0
          self.freeFileBeforeLoad = 0
          self.UpdateFileOnLoad = 0
    
!----------------------------------------------------
DctXml.Load   PROCEDURE (*Group p_Group, string p_FileName,string p_FileBoundary,string p_RecordBoundary)
ReturnValue   long
  CODE
    self.Trace('DctXml.Load - p_FileBoundary = ' & p_FileBoundary & ' p_RecordBoundary = ' & p_RecordBoundary) 
  ReturnValue = PARENT.Load (p_Group,p_FileName,p_FileBoundary,p_RecordBoundary)
    Return ReturnValue
!----------------------------------------------------
DctXml.Load   PROCEDURE (*Group p_Group, *string p_String, long p_Length)
ReturnValue   long
  CODE
    self.Trace('DctXml.Load - p_String = ' & p_String) 
  ReturnValue = PARENT.Load (p_Group,p_String,p_Length)
    Return ReturnValue
!----------------------------------------------------
DctXml.Load   PROCEDURE (*Group p_Group, *string p_String, long p_Length,string p_FileBoundary,string p_RecordBoundary)
ReturnValue   long
  CODE
    self.Trace('DctXml.Load - p_String = ' & clip(p_String) & ' p_FileBoundary = ' & p_FileBoundary & ' p_RecordBoundary = ' & p_RecordBoundary) 
  ReturnValue = PARENT.Load (p_Group,p_String,p_Length,p_FileBoundary,p_RecordBoundary)
    Return ReturnValue
!----------------------------------------------------
DctXml.Load   PROCEDURE (*Queue p_Queue, string p_FileName,string p_FileBoundary,string p_RecordBoundary)
ReturnValue   long
  CODE
    self.Trace('DctXml.Load - p_FileName = ' & clip(p_FileName) & ' p_FileBoundary = ' & p_FileBoundary & ' p_RecordBoundary = ' & p_RecordBoundary) 
  ReturnValue = PARENT.Load (p_Queue,p_FileName,p_FileBoundary,p_RecordBoundary)
    Return ReturnValue
!----------------------------------------------------
DctXml.AssignField   PROCEDURE (String pString)
  CODE
    self.Trace('DctXml.AssignField - self.currentTag = ' & clip(self.currentTag) & '    -     self.CurrentField = ' & self.CurrentField) 
  PARENT.AssignField (pString)
!----------------------------------------------------
DctXml.ParseAttr   PROCEDURE (String pAttr)
st              StringTheory
  CODE
    self.Trace('DctXml.ParseAttr - pAttr = ' & pAttr)
    st.SetValue(pAttr,1)
    If Not st.Instring('Driver')
        If st.Instring('KeyType',1) 
            Free(KeysQ)   
            KeysXml.start()
            KeysXml.TagCase = XF:CaseAny
            KeysXml.Load(KeysQ,clip(DctxFilename),'Dictionary','Key')
            return
        Elsif st.Instring('DataType',1)
            Free(FieldsQ)
            FieldsXml.start()
            FieldsXml.TagCase = XF:CaseAny
            FieldsXml.Load(FieldsQ,clip(DctxFilename),'Dictionary','Field')
            return
        End
        RETURN
    End 
  PARENT.ParseAttr (pAttr)
