  MEMBER('DctxParser.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('DctxParser_BC0.CLW')
DctxParser_BC0:DctInit             PROCEDURE()
DctxParser_BC0:DctKill             PROCEDURE()
DctxParser_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  DctxParser_BC0:DctInit
  DctxParser_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  DctxParser_BC0:DctKill

