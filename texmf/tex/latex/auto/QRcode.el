(TeX-add-style-hook "QRcode"
 (lambda ()
    (TeX-add-symbols
     "QRnumA"
     "QRnumC"
     "QRnumE"
     "QRnumG"
     "QRbounding"
     "QRpixelUnit"
     "basePixelUnit"
     "DPI"
     "QRreset"
     "QRcontent"
     "QRdata"
     "QRdataadd"
     "QRdatacont"
     "QRdatacontcont"
     "orioplus"
     "oplus"
     "QRempty"
     "QRspace"
     "QRtypeN"
     "QRtypeA"
     "QRtypeB"
     "gobbleone"
     "gobblesecond"
     "doubleToken"
     "QRdefBlocks"
     "QRSetMinECLevel"
     "QRSetECLevel"
     "QRBIN"
     "UTFlist"
     "UTF"
     "CATlist"
     "CAT"
     "makeactive"
     "makeother"
     "CATother"
     "CATori"
     "QRchars"
     "plainchars"
     "CATdo"
     "UTFdo"
     "NUMERIC"
     "isALPHANUMERIC"
     "isNUMERIC"
     "tst"
     "defQRtype"
     "BINNUM"
     "ALPHANUM"
     "MATCHALPHA"
     "ALPHANUMnext"
     "MATCHEDALPHA"
     "QRBswitchCostLow"
     "QRBswitchCostMed"
     "QRBswitchCostHigh"
     "QRAswitchCostLow"
     "QRAswitchCostMed"
     "QRAswitchCostHigh"
     "QRNswitchCostLow"
     "QRNswitchCostMed"
     "QRNswitchCostHigh"
     "QRswitchCostsLow"
     "QRswitchCostsMed"
     "QRswitchCostsHigh"
     "QRBswitchCost"
     "QRAswitchCost"
     "QRNswitchCost"
     "QRLowLimit"
     "QRMedLimit"
     "QRinfty"
     "QRDiag"
     "QRSchemaN"
     "DIAGcontent"
     "prevQRtype"
     "test"
     "QRDIAGnext"
     "QRDIAGend"
     "QRtypeChange"
     "futF"
     "futC"
     "futQRSchemaB"
     "futE"
     "futB"
     "futQRSchemaA"
     "QRSchemaB"
     "QRSchemaA"
     "binaryReset"
     "NUMBIN"
     "NUMBINNEXTDIGIT"
     "NUMBINnextdigit"
     "NUMBINnext"
     "NUMBINEND"
     "showOne"
     "showZero"
     "showing"
     "binaryShow"
     "PACKcontent"
     "takeFirstQRSchema"
     "QRtype"
     "takeFirstQRSchemaCont"
     "QRSchema"
     "PackQRTypeBlock"
     "PackQRTypeBlockLoop"
     "PackQRTypeBlockNext"
     "PACKQRTypeBlockFlush"
     "setQRversion"
     "chooseMaxECLevel"
     "EClevel"
     "chooseECLevel"
     "versionChooseLoopBreakTest"
     "chooseVersionToFit"
     "fixVersion"
     "freeVersion"
     "chooseVersion"
     "PAD"
     "PADbyXVI"
     "PADnext"
     "PADlastVIII"
     "ReedSolomon"
     "binarySplit"
     "defbinary"
     "QRSplitBlocks"
     "processSplit"
     "ReedSolomonCheck"
     "takeByte"
     "takeEight"
     "byte"
     "taken"
     "QRMergeBlocks"
     "QRMergeECs"
     "GFmodulo"
     "GFid"
     "GFnegNine"
     "GFxorZeroReady"
     "GFxorOneReady"
     "GFxorReady"
     "GFZeroReady"
     "GFOneReady"
     "GFReady"
     "GFZeroGobble"
     "GFOneGobble"
     "GFGobble"
     "GFadd"
     "GFmod"
     "GFx"
     "GFone"
     "GFzero"
     "GFLOGEXPloop"
     "GFLOGEXPnext"
     "GFlog"
     "GFexp"
     "GFmul"
     "GFacc"
     "GFoneover"
     "GFshow"
     "GFPreset"
     "GFPresetnext"
     "GFPmul"
     "GFPmulnextloop"
     "GFPmulnextnext"
     "GFPmulnext"
     "GFPcopy"
     "GFPcopyloop"
     "GFPshiftLeft"
     "GFPshiftLeftCont"
     "GFPshiftLeftLoop"
     "GFPshiftLeftClearLoop"
     "GFPgenloop"
     "GFPProdDeg"
     "GFPreducedeg"
     "GFPreducedegloop"
     "GFPmod"
     "GFPmodloop"
     "GFPshiftsubloop"
     "GFPshow"
     "GFPshowloop"
     "binaryToGFPloopend"
     "binaryToGFP"
     "binaryToGFPloop"
     "GFPTobinary"
     "GFPTobinaryloop"
     "noexpand"
     "QRShowBitsMode"
     "QRSetBitsMode"
     "QRBigFixed"
     "QRFixed"
     "QRecMaskInfo"
     "QRSetLoop"
     "QRSet"
     "QRSetLoopTwo"
     "QRSetBit"
     "QRSetStartColumn"
     "QRinit"
     "QRInit"
     "QRFill"
     "QRFillLoop"
     "QRFillLoopLoop"
     "QRFillLoopLoopDo"
     "QRPutBasic"
     "QRPutTwoBigFixed"
     "QRPutBigFixedSym"
     "QRPutBigFixedLine"
     "QRPutBigFixedLineLoop"
     "QRPutFinders"
     "QRPutFixed"
     "QRPutTwoFixed"
     "QRPutAlignOffs"
     "QRPutAlignment"
     "QRPutAligns"
     "QRPutAlignsLoop"
     "QRPutAlignsLoopLoop"
     "QRPutVersion"
     "binSplit"
     "QRVersionBCHmodLoop"
     "XorOOOOZZOZZOZO"
     "XorZOZO"
     "QRVersionPutBitsLoop"
     "QRPutTimers"
     "QRPutTimersLoop"
     "QRPutECMaskInfoBit"
     "QRPutECMaskInfoBitPos"
     "QRPutECMaskInfo"
     "QRId"
     "QRNeg"
     "QRSetMask"
     "QRdefMasks"
     "QRdefMasksLoop"
     "QRdefMasksLoopLoop"
     "QRdefMasksLoopLoopDo"
     "QRSetecMaskOnMlK"
     "QRSetecMasknMlK"
     "QRSetecMaskMlK"
     "QRSetecMasklK"
     "QRSetecMaskK"
     "QRSetecMaskjihgfEdcBa"
     "QRSetecMaskihgfEdcBa"
     "QRSetecMaskhgfEdcBa"
     "QRSetecMaskgfEdcBa"
     "QRSetecMaskfEdcBa"
     "QRSetecMaskEdcBa"
     "QRSetecMaskdcBa"
     "QRSetecMaskcBa"
     "QRSetecMaskBa"
     "QRSetecMaska"
     "QRSetecMask"
     "QRSetecMaskBCHmodLoop"
     "XorZOZZOOZOOO"
     "XorOO"
     "QRSetecMaskEC"
     "countQRDemerits"
     "QRcountStaticZero"
     "QRcountStaticOne"
     "QRcountStatic"
     "QRcountDarkZero"
     "QRcountDarkOne"
     "QRcountDark"
     "QRtoBinaryOne"
     "QRtoBinaryZero"
     "QRtoBinary"
     "QRtstSquareZero"
     "QRtstSquareOne"
     "countBinaryStaticDemerits"
     "countBinaryPatternOneDemerits"
     "countBinaryPatternTwoDemerits"
     "countBinaryPatternThreeDemerits"
     "tmp"
     "countBinaryPatternDemerits"
     "countBinaryDemerits"
     "countRowQRDemeritsAndDark"
     "countRowQRDemeritsAndDarkLoop"
     "countColQRDemerits"
     "countColQRDemeritsLoop"
     "countDarkQRDemerits"
     "QRRowToBinary"
     "QRRowToBinaryLoop"
     "QRColToBinary"
     "QRColToBinaryLoop"
     "countSquareQRDemerits"
     "countSquareQRDemeritsLoop"
     "countSquareQRDemeritsLoopLoop"
     "countSquareQRDemeritsLoopLoopDo"
     "binary"
     "QRSelectMask"
     "SelectQRMaskIfBetter"
     "QRbestMask"
     "QRdimen"
     "QRdimenCont"
     "defQRversionSizes"
     "defQRversionSize"
     "QRSetBox"
     "QRShowContent"
     "QRShowContentLoop"
     "QRShowContentLoopLoop"
     "QRShowContentLoopLoopDo"
     "QRPstart"
     "QRPay"
     "QRLog"
     "QRLogLoop"
     "QRLogLoopLoop"
     "QRLogLoopLoopDo"
     "showdo"
     "QRminVersion"
     "QRmaxVersion"
     "QRLogMask"
     "QRLogMaskLoop"
     "QRLogMaskLoopLoop"
     "QRLogMaskLoopLoopDo")))

