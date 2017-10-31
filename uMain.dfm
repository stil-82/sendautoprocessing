object Form1: TForm1
  Left = 175
  Top = 111
  Width = 880
  Height = 598
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 96
    Top = 216
    Width = 289
    Height = 25
    Caption = #1050#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1088#1072#1089#1089#1099#1083#1082#1080' '#1086#1090#1074#1077#1090#1086#1074' '#1085#1072' '#1076#1080#1089#1087#1072#1085#1089#1077#1088#1080#1079#1072#1094#1080#1102
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 408
    Top = 216
    Width = 289
    Height = 25
    Caption = #1050#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1088#1072#1089#1089#1099#1083#1082#1080' sobr.files'
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 408
    Top = 272
    Width = 289
    Height = 25
    Caption = #1050#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1088#1072#1089#1089#1099#1083#1082#1080' merge'
    TabOrder = 2
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 408
    Top = 400
    Width = 289
    Height = 25
    Caption = #1050#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1088#1072#1089#1089#1099#1083#1082#1080' '#1089#1074#1077#1088#1082#1080' '#1089' '#1048#1043#1057#1052
    TabOrder = 3
    OnClick = btn4Click
  end
  object orsnSession: TOraSession
    Options.KeepDesignConnected = False
    Username = 'disp_send_out_serv'
    Password = '123'
    Server = 'OMS'
    AutoCommit = False
    Connected = True
    Left = 36
    Top = 32
  end
  object ora: TOraQuery
    Session = orsnSession
    SQL.Strings = (
      'select *'
      'from sobr.stek_disp_out'
      'where posted is null'
      
        '--where (filename like '#39'DISP_K_15042%'#39' or filename like '#39'%15057%' +
        #39' /*or filename like '#39'%05028%'#39'*/)'
      '--and received>sysdate-10')
    FetchAll = True
    Left = 88
    Top = 32
  end
  object src: TOraDataSource
    Left = 136
    Top = 32
  end
  object oraUpd: TOraQuery
    Session = orsnSession
    SQL.Strings = (
      'update sobr.stek_disp_out'
      'set posted=sysdate'
      'where id=:id')
    Left = 88
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end>
  end
  object tmr: TTimer
    Interval = 600000
    OnTimer = tmrTimer
    Left = 272
    Top = 64
  end
  object oraSobrFiles: TOraQuery
    Session = orsnSession
    SQL.Strings = (
      'select *'
      'from sobr.files'
      'where dt>sysdate-1'
      '--and filename like '#39'DISP_R%'#39
      '--and filename like '#39'%'#1088#1086#1089#1089'%'#39
      '--and filename like '#39'DISP_K_%'#39
      
        '--and (filename like '#39'DISP_K_08032%.zip'#39' or filename like '#39'DISP_' +
        'K_08060%.zip'#39')'
      'and filename like '#39'FLK_DISP_S%'#39' '
      '--and file_id=63174'
      '--and filename like '#39'%DISP_%_08036_011_1704141190%'#39
      ''
      ''
      ''
      ''
      '/*'
      '--'#1086#1090#1087#1088#1072#1074#1082#1072' '#1087#1076#1092#1082#1080' '#1089' '#1089#1086#1086#1073#1097#1077#1085#1080#1077#1084
      'select r.rule,'
      '         f.filename,'
      '         f.file_body'
      'from ('
      'select distinct to_char(l.rule) rule,'
      '                    to_char(sk.rules) rule'
      '              from --sobr.files f,'
      '                      sobr.disp_bill# b,'
      '                  NSI.k_$rule_LPU l,'
      '                  NSI.K_$RULE_SMO sk'
      '          where  b.kdate=l.kdate'
      '          and  b.kdlpu =l.kdlpu'
      '          and  b.kdsk=sk.kdsk(+)'
      '          and b.otper=to_date('#39'01012017'#39','#39'DDMMYYYY'#39')'
      '          and b.summav!=0'
      '          )r,'
      '          sobr.files f'
      '          where f.dt>sysdate-1'
      '*/')
    FetchAll = True
    Left = 488
    Top = 72
  end
  object srcSobrFiles: TOraDataSource
    DataSet = oraSobrFiles
    Left = 536
    Top = 72
  end
  object oraMerge: TOraQuery
    Session = orsnSession
    SQL.Strings = (
      'select --f.*,'
      '                    b.name,'
      '                    b.reestr_xls, '
      '                    b.bill_pdf,'
      '                    to_char(l.rule) rule_u,'
      '                    to_char(sk.rules) rule_sk '
      '              from --sobr.files f,'
      '                      sobr.disp_bill# b,'
      '                  NSI.k_$rule_LPU l,'
      '                  NSI.K_$RULE_SMO sk'
      '          where  b.kdate=l.kdate'
      '          and  b.kdlpu =l.kdlpu'
      '          and  b.kdsk=sk.kdsk(+)'
      '          and b.otper=to_date('#39'01092017'#39','#39'DDMMYYYY'#39')'
      '          and b.summav!=0'
      '          --and name like '#39'S190%D_%'#39
      '          --and b.rn=2'
      '          --and b.name like '#39'%15002%'#39
      
        '          --and (reestr_xls is not null and length(reestr_xls)!=' +
        '0)'
      '           --and name in ('#39'S190_0817_D_01006_1'#39')')
    FetchAll = True
    Left = 464
    Top = 328
  end
  object srcMerge: TOraDataSource
    DataSet = oraMerge
    Left = 512
    Top = 328
  end
  object oraIgsm: TOraQuery
    Session = orsnSession
    SQL.Strings = (
      'select *'
      'from sobr.files'
      'where dt>sysdate-1'
      'and filename like '#39'sverka_%'#39)
    FetchAll = True
    Left = 488
    Top = 464
  end
  object srcIgsm: TOraDataSource
    DataSet = oraIgsm
    Left = 536
    Top = 464
  end
end
