xof 0303txt 0032

template Frame {
  <3d82ab46-62da-11cf-ab39-0020af71e433>
  [...]
}

template Matrix4x4 {
  <f6f23f45-7686-11cf-8f52-0040333594a3>
  array FLOAT matrix[16];
}

template FrameTransformMatrix {
  <f6f23f41-7686-11cf-8f52-0040333594a3>
  Matrix4x4 frameMatrix;
}

template Vector {
  <3d82ab5e-62da-11cf-ab39-0020af71e433>
  FLOAT x;
  FLOAT y;
  FLOAT z;
}

template MeshFace {
  <3d82ab5f-62da-11cf-ab39-0020af71e433>
  DWORD nFaceVertexIndices;
  array DWORD faceVertexIndices[nFaceVertexIndices];
}

template Mesh {
  <3d82ab44-62da-11cf-ab39-0020af71e433>
  DWORD nVertices;
  array Vector vertices[nVertices];
  DWORD nFaces;
  array MeshFace faces[nFaces];
  [...]
}

template MeshNormals {
  <f6f23f43-7686-11cf-8f52-0040333594a3>
  DWORD nNormals;
  array Vector normals[nNormals];
  DWORD nFaceNormals;
  array MeshFace faceNormals[nFaceNormals];
}

template Coords2d {
  <f6f23f44-7686-11cf-8f52-0040333594a3>
  FLOAT u;
  FLOAT v;
}

template MeshTextureCoords {
  <f6f23f40-7686-11cf-8f52-0040333594a3>
  DWORD nTextureCoords;
  array Coords2d textureCoords[nTextureCoords];
}

template ColorRGBA {
  <35ff44e0-6c7c-11cf-8f52-0040333594a3>
  FLOAT red;
  FLOAT green;
  FLOAT blue;
  FLOAT alpha;
}

template IndexedColor {
  <1630b820-7842-11cf-8f52-0040333594a3>
  DWORD index;
  ColorRGBA indexColor;
}

template MeshVertexColors {
  <1630b821-7842-11cf-8f52-0040333594a3>
  DWORD nVertexColors;
  array IndexedColor vertexColors[nVertexColors];
}

template VertexElement {
  <f752461c-1e23-48f6-b9f8-8350850f336f>
  DWORD Type;
  DWORD Method;
  DWORD Usage;
  DWORD UsageIndex;
}

template DeclData {
  <bf22e553-292c-4781-9fea-62bd554bdd93>
  DWORD nElements;
  array VertexElement Elements[nElements];
  DWORD nDWords;
  array DWORD data[nDWords];
}

Frame DXCC_ROOT {
  FrameTransformMatrix {
     1.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000,
    0.0000000000000000, 1.0000000000000000, 0.0000000000000000, 0.0000000000000000,
    0.0000000000000000, 0.0000000000000000, 1.0000000000000000, 0.0000000000000000,
    0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 1.0000000000000000;;
  }

  Frame 1llzcr0roxto_obj {
    FrameTransformMatrix {
       1.0000000000000000, 0.0000000000000000, -0.0000000000000000, 0.0000000000000000,
      0.0000000000000000, 1.0000000000000000, -0.0000000000000000, 0.0000000000000000,
      -0.0000000000000000, -0.0000000000000000, 1.0000000000000000, -0.0000000000000000,
      0.0000000000000000, 0.0000000000000000, -0.0000000000000000, 1.0000000000000000;;
    }

    Frame Box177_Mesh_005 {
      FrameTransformMatrix {
         1.0000000000000000, 0.0000000000000000, -0.0000000000000000, 0.0000000000000000,
        0.0000000000000000, 1.0000000000000000, -0.0000000000000000, 0.0000000000000000,
        -0.0000000000000000, -0.0000000000000000, 1.0000000000000000, -0.0000000000000000,
        0.0000000000000000, 0.0000000000000000, -0.0000000000000000, 1.0000000000000000;;
      }

      Mesh Box177_Mesh_005_mShape {
        184;
        0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        -0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        -0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        -0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        -0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        -0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        -0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        0.0099630001932383;0.1161319985985756;-0.0367540009319782;,
        0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        0.0099630001932383;0.1340750008821487;-0.0379020012915134;,
        -0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        -0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        -0.0099630001932383;0.1340750008821487;-0.0379020012915134;,
        -0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        -0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        -0.0099630001932383;0.1161319985985756;-0.0367540009319782;,
        -0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        -0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        0.0099630001932383;0.1121850013732910;0.0100999996066093;,
        0.0099630001932383;0.1432619988918304;0.0100999996066093;,
        0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        -0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        -0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        -0.0099630001932383;0.1432619988918304;0.0100999996066093;,
        -0.0099630001932383;0.1121850013732910;0.0100999996066093;,
        -0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        -0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        -0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        -0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        -0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        -0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        -0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        -0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        -0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        -0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        -0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        -0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        -0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        -0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        -0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        -0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        -0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        -0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        -0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        -0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        -0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        -0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        -0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        -0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        -0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        -0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        0.0099630001932383;0.1161319985985756;-0.0367540009319782;,
        0.0099630001932383;0.1340750008821487;-0.0379020012915134;,
        0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        -0.0099630001932383;0.1340750008821487;-0.0379020012915134;,
        -0.0099630001932383;0.1161319985985756;-0.0367540009319782;,
        -0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        -0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        0.0099630001932383;0.1432619988918304;0.0100999996066093;,
        0.0099630001932383;0.1121850013732910;0.0100999996066093;,
        0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        -0.0099630001932383;0.1121850013732910;0.0100999996066093;,
        -0.0099630001932383;0.1432619988918304;0.0100999996066093;,
        -0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        -0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        0.0099630001932383;0.1340750008821487;-0.0379020012915134;,
        0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        -0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        -0.0099630001932383;0.1340750008821487;-0.0379020012915134;,
        -0.0062970002181828;0.1376149952411652;-0.0381290018558502;,
        -0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        -0.0099630001932383;0.1161319985985756;-0.0367540009319782;,
        -0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        -0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        -0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        0.0099630001932383;0.1161319985985756;-0.0367540009319782;,
        0.0062970002181828;0.1122080013155937;-0.0364629998803139;,
        0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        -0.0099630001932383;0.1432619988918304;0.0100999996066093;,
        -0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        -0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        -0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        0.0099630001932383;0.1432619988918304;0.0100999996066093;,
        0.0062970002181828;0.1468019932508469;0.0100999996066093;,
        0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        0.0099630001932383;0.1121850013732910;0.0100999996066093;,
        0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        -0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        -0.0099630001932383;0.1121850013732910;0.0100999996066093;,
        -0.0062970002181828;0.1082609966397285;0.0100999996066093;,
        -0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        -0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        -0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        -0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        -0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        -0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        -0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        -0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        -0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        -0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        -0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        -0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        -0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        0.0099630001932383;0.1355520039796829;-0.0359509997069836;,
        0.0099630001932383;0.1385660022497177;0.0004260000132490;,
        0.0062970002181828;0.1421049982309341;0.0004260000132490;,
        0.0062970002181828;0.1390909999608994;-0.0361780002713203;,
        0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        -0.0099630001932383;0.1141090020537376;-0.0343879982829094;,
        -0.0099630001932383;0.1174039989709854;0.0013470000121742;,
        -0.0062970002181828;0.1134800016880035;0.0013470000121742;,
        -0.0062970002181828;0.1101860031485558;-0.0340979993343353;,
        -0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        -0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        -0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        -0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        0.0099630001932383;0.1393370032310486;0.0029490001033992;,
        0.0099630001932383;0.1432619988918304;0.0050909998826683;,
        0.0062970002181828;0.1468019932508469;0.0050909998826683;,
        0.0062970002181828;0.1428769975900650;0.0029490001033992;,
        0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        0.0062970002181828;0.1121850013732910;0.0033720000647008;,
        0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        -0.0099630001932383;0.1161080002784729;0.0033720000647008;,
        -0.0099630001932383;0.1121850013732910;0.0050909998826683;,
        -0.0062970002181828;0.1082609966397285;0.0050909998826683;,
        -0.0062970002181828;0.1121850013732910;0.0033720000647008;;
        46;
        4;3,2,1,0;,
        4;7,6,5,4;,
        4;11,10,9,8;,
        4;15,14,13,12;,
        4;19,18,17,16;,
        4;23,22,21,20;,
        4;27,26,25,24;,
        4;31,30,29,28;,
        4;35,34,33,32;,
        4;39,38,37,36;,
        4;43,42,41,40;,
        4;47,46,45,44;,
        4;51,50,49,48;,
        4;55,54,53,52;,
        4;59,58,57,56;,
        4;63,62,61,60;,
        4;67,66,65,64;,
        4;71,70,69,68;,
        4;75,74,73,72;,
        4;79,78,77,76;,
        4;83,82,81,80;,
        4;87,86,85,84;,
        4;91,90,89,88;,
        4;95,94,93,92;,
        4;99,98,97,96;,
        4;103,102,101,100;,
        4;107,106,105,104;,
        4;111,110,109,108;,
        4;115,114,113,112;,
        4;119,118,117,116;,
        4;123,122,121,120;,
        4;127,126,125,124;,
        4;131,130,129,128;,
        4;135,134,133,132;,
        4;139,138,137,136;,
        4;143,142,141,140;,
        4;147,146,145,144;,
        4;151,150,149,148;,
        4;155,154,153,152;,
        4;159,158,157,156;,
        4;163,162,161,160;,
        4;167,166,165,164;,
        4;171,170,169,168;,
        4;175,174,173,172;,
        4;179,178,177,176;,
        4;183,182,181,180;;

        MeshMaterialList {
          1;
          46;
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
          Material {
            1.0; 1.0; 1.0; 1.000000;;
            1.000000;
            0.000000; 0.000000; 0.000000;;
            0.000000; 0.000000; 0.000000;;
            TextureFilename { ""; }
          }
        }

        MeshNormals {
        184;
        0.0017000000225380;0.0652000010013580;0.9979000091552734;,
        0.0017999999690801;0.0652000010013580;0.9979000091552734;,
        -0.0017999999690801;0.0652000010013580;0.9979000091552734;,
        -0.0017000000225380;0.0652000010013580;0.9979000091552734;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.3698000013828278;-0.7408000230789185;0.5606999993324280;,
        -0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        0.3698000013828278;-0.7408000230789185;0.5606999993324280;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        0.3664000034332275;0.7073000073432922;0.6046000123023987;,
        0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        -0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        -0.3664000034332275;0.7073000073432922;0.6046000123023987;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        0.3745000064373016;-0.9272000193595886;0.0000000000000000;,
        0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        -0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        -0.3745000064373016;-0.9272000193595886;0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -0.3982999920845032;0.9172999858856201;0.0000000000000000;,
        -0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        0.3982999920845032;0.9172999858856201;0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        -0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        -0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        -0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        -0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        -0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        -0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        -0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        -0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        -0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        -0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        1.0000000000000000;-0.0000000000000000;-0.0000000000000000;,
        0.0054000001400709;0.0648000016808510;0.9979000091552734;,
        0.0054000001400709;0.0648000016808510;0.9979000091552734;,
        0.0017999999690801;0.0652000010013580;0.9979000091552734;,
        0.0017000000225380;0.0652000010013580;0.9979000091552734;,
        -0.0054000001400709;0.0648000016808510;0.9979000091552734;,
        -0.0054000001400709;0.0648000016808510;0.9979000091552734;,
        -0.0017000000225380;0.0652000010013580;0.9979000091552734;,
        -0.0017999999690801;0.0652000010013580;0.9979000091552734;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        0.0000000000000000;-0.0000000000000000;-1.0000000000000000;,
        -0.6280000209808350;-0.6205000281333923;0.4695999920368195;,
        -0.6725999712944031;-0.6786999702453613;0.2948000133037567;,
        -0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        -0.3698000013828278;-0.7408000230789185;0.5606999993324280;,
        0.6725999712944031;-0.6786999702453613;0.2948000133037567;,
        0.6280000209808350;-0.6205000281333923;0.4695999920368195;,
        0.3698000013828278;-0.7408000230789185;0.5606999993324280;,
        0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        0.6060000061988831;0.6046000123023987;0.5169000029563904;,
        0.6901999711990356;0.6668000221252441;0.2809999883174896;,
        0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        0.3664000034332275;0.7073000073432922;0.6046000123023987;,
        -0.6901999711990356;0.6668000221252441;0.2809999883174896;,
        -0.6060000061988831;0.6046000123023987;0.5169000029563904;,
        -0.3664000034332275;0.7073000073432922;0.6046000123023987;,
        -0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        0.6945000290870667;-0.7195000052452087;0.0000000000000000;,
        0.5934000015258789;-0.6147000193595886;0.5196999907493591;,
        0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        0.3745000064373016;-0.9272000193595886;0.0000000000000000;,
        -0.5934000015258789;-0.6147000193595886;0.5196999907493591;,
        -0.6945000290870667;-0.7195000052452087;0.0000000000000000;,
        -0.3745000064373016;-0.9272000193595886;0.0000000000000000;,
        -0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        -0.7307000160217285;0.6826999783515930;-0.0000000000000000;,
        -0.6018000245094299;0.5623000264167786;0.5672000050544739;,
        -0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        -0.3982999920845032;0.9172999858856201;0.0000000000000000;,
        0.6018000245094299;0.5623000264167786;0.5672000050544739;,
        0.7307000160217285;0.6826999783515930;-0.0000000000000000;,
        0.3982999920845032;0.9172999858856201;0.0000000000000000;,
        0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        0.6248000264167786;-0.6471999883651733;0.4368000030517578;,
        0.6891000270843506;-0.7128000259399414;0.1306000053882599;,
        0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        -0.6891000270843506;-0.7128000259399414;0.1306000053882599;,
        -0.6248000264167786;-0.6471999883651733;0.4368000030517578;,
        -0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        -0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        -0.6096000075340271;0.5695999860763550;0.5512999892234802;,
        -0.7238000035285950;0.6750000119209290;0.1432999968528748;,
        -0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        -0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        0.7238000035285950;0.6750000119209290;0.1432999968528748;,
        0.6096000075340271;0.5695999860763550;0.5512999892234802;,
        0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        0.6891000270843506;-0.7128000259399414;0.1306000053882599;,
        0.6725999712944031;-0.6786999702453613;0.2948000133037567;,
        0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        -0.6725999712944031;-0.6786999702453613;0.2948000133037567;,
        -0.6891000270843506;-0.7128000259399414;0.1306000053882599;,
        -0.3792000114917755;-0.9079999923706055;0.1781000047922134;,
        -0.3456999957561493;-0.8805999755859375;0.3240000009536743;,
        -0.7238000035285950;0.6750000119209290;0.1432999968528748;,
        -0.6901999711990356;0.6668000221252441;0.2809999883174896;,
        -0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        -0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        0.6901999711990356;0.6668000221252441;0.2809999883174896;,
        0.7238000035285950;0.6750000119209290;0.1432999968528748;,
        0.4216000139713287;0.8765000104904175;0.2322999984025955;,
        0.3555999994277954;0.8963999748229980;0.2644000053405762;,
        0.5934000015258789;-0.6147000193595886;0.5196999907493591;,
        0.6248000264167786;-0.6471999883651733;0.4368000030517578;,
        0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        -0.6248000264167786;-0.6471999883651733;0.4368000030517578;,
        -0.5934000015258789;-0.6147000193595886;0.5196999907493591;,
        -0.3185000121593475;-0.8314999938011169;0.4550999999046326;,
        -0.3093000054359436;-0.6951000094413757;0.6489999890327454;,
        -0.6018000245094299;0.5623000264167786;0.5672000050544739;,
        -0.6096000075340271;0.5695999860763550;0.5512999892234802;,
        -0.2766000032424927;0.5781999826431274;0.7675999999046326;,
        -0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        0.6096000075340271;0.5695999860763550;0.5512999892234802;,
        0.6018000245094299;0.5623000264167786;0.5672000050544739;,
        0.3337999880313873;0.8088999986648560;0.4839999973773956;,
        0.2766000032424927;0.5781999826431274;0.7675999999046326;;
        46;
        4;3,2,1,0;,
        4;7,6,5,4;,
        4;11,10,9,8;,
        4;15,14,13,12;,
        4;19,18,17,16;,
        4;23,22,21,20;,
        4;27,26,25,24;,
        4;31,30,29,28;,
        4;35,34,33,32;,
        4;39,38,37,36;,
        4;43,42,41,40;,
        4;47,46,45,44;,
        4;51,50,49,48;,
        4;55,54,53,52;,
        4;59,58,57,56;,
        4;63,62,61,60;,
        4;67,66,65,64;,
        4;71,70,69,68;,
        4;75,74,73,72;,
        4;79,78,77,76;,
        4;83,82,81,80;,
        4;87,86,85,84;,
        4;91,90,89,88;,
        4;95,94,93,92;,
        4;99,98,97,96;,
        4;103,102,101,100;,
        4;107,106,105,104;,
        4;111,110,109,108;,
        4;115,114,113,112;,
        4;119,118,117,116;,
        4;123,122,121,120;,
        4;127,126,125,124;,
        4;131,130,129,128;,
        4;135,134,133,132;,
        4;139,138,137,136;,
        4;143,142,141,140;,
        4;147,146,145,144;,
        4;151,150,149,148;,
        4;155,154,153,152;,
        4;159,158,157,156;,
        4;163,162,161,160;,
        4;167,166,165,164;,
        4;171,170,169,168;,
        4;175,174,173,172;,
        4;179,178,177,176;,
        4;183,182,181,180;;
        }

        MeshTextureCoords {
        184;
        0.2626770138740540;0.1928960084915161;,
        0.2626770138740540;0.4662629961967468;,
        0.4025230109691620;0.4662629961967468;,
        0.4025230109691620;0.1928960084915161;,
        0.1807900071144104;0.4662629961967468;,
        0.1807900071144104;0.0382850170135498;,
        0.0409439988434315;0.0382850170135498;,
        0.0409439988434315;0.4662629961967468;,
        0.9590560197830200;0.9922869801521301;,
        0.9590560197830200;0.9671869874000549;,
        0.8192099928855896;0.9671869874000549;,
        0.8192099928855896;0.9922869801521301;,
        0.4767610132694244;0.4794719815254211;,
        0.4543049931526184;0.5057410001754761;,
        0.6924149990081787;0.4883859753608704;,
        0.6760190129280090;0.4667220115661621;,
        0.4025230109691620;0.1928960084915161;,
        0.4025230109691620;0.1632509827613831;,
        0.2626770138740540;0.1632509827613831;,
        0.2626770138740540;0.1928960084915161;,
        0.2868860065937042;0.9997709989547729;,
        0.3032819926738739;0.9781069755554199;,
        0.0651720017194748;0.9607520103454590;,
        0.0876279994845390;0.9870200157165527;,
        0.8192099928855896;0.4483109712600708;,
        0.8192099928855896;0.5021300315856934;,
        0.9590560197830200;0.5021300315856934;,
        0.9590560197830200;0.4483109712600708;,
        0.4329349994659424;0.9997699856758118;,
        0.7780370116233826;0.9997699856758118;,
        0.7780370116233826;0.9441519975662231;,
        0.4329349994659424;0.9441519975662231;,
        0.7287049889564514;0.3264170289039612;,
        0.6731470227241516;0.3264170289039612;,
        0.6731470227241516;0.4662629961967468;,
        0.7287049889564514;0.4662629961967468;,
        0.3889040052890778;0.4667220115661621;,
        0.0438009984791279;0.4667220115661621;,
        0.0438020005822182;0.5223410129547119;,
        0.3889040052890778;0.5223410129547119;,
        0.8192099928855896;0.5361440181732178;,
        0.8192099928855896;0.5654189586639404;,
        0.9590560197830200;0.5654189586639404;,
        0.9590560197830200;0.5361440181732178;,
        0.4908849895000458;0.9025689959526062;,
        0.4765009880065918;0.9250599741935730;,
        0.7344520092010498;0.9203659892082214;,
        0.7258859872817993;0.8923450112342834;,
        0.4436959922313690;0.0495920181274414;,
        0.4436959922313690;0.0713930130004883;,
        0.5835419893264771;0.0713930130004883;,
        0.5835419893264771;0.0495920181274414;,
        0.3453190028667450;0.5461269617080688;,
        0.0873679965734482;0.5414329767227173;,
        0.1017519980669022;0.5639240145683289;,
        0.3367530107498169;0.5741479992866516;,
        0.8192099928855896;0.5654189586639404;,
        0.8192099928855896;0.9671869874000549;,
        0.9590560197830200;0.9671869874000549;,
        0.9590560197830200;0.5654189586639404;,
        0.4908849895000458;0.9025689959526062;,
        0.7258859872817993;0.8923450112342834;,
        0.6924149990081787;0.4883859753608704;,
        0.4543049931526184;0.5057410001754761;,
        0.4436959922313690;0.0713930130004883;,
        0.4436959922313690;0.4662629961967468;,
        0.5835419893264771;0.4662629961967468;,
        0.5835419893264771;0.0713930130004883;,
        0.3032819926738739;0.9781069755554199;,
        0.3367530107498169;0.5741479992866516;,
        0.1017519980669022;0.5639240145683289;,
        0.0651720017194748;0.9607520103454590;,
        0.8192099928855896;0.5021300315856934;,
        0.8192099928855896;0.5361440181732178;,
        0.9590560197830200;0.5361440181732178;,
        0.9590560197830200;0.5021300315856934;,
        0.4765009880065918;0.9250599741935730;,
        0.4329349994659424;0.9441519975662231;,
        0.7780370116233826;0.9441519975662231;,
        0.7344520092010498;0.9203659892082214;,
        0.6726869940757751;0.2857030034065247;,
        0.6253110170364380;0.2857030034065247;,
        0.6253110170364380;0.4255489706993103;,
        0.6726869940757751;0.4255489706993103;,
        0.3889040052890778;0.5223410129547119;,
        0.0438020005822182;0.5223410129547119;,
        0.0873679965734482;0.5414329767227173;,
        0.3453190028667450;0.5461269617080688;,
        0.2219630032777786;0.2352330088615417;,
        0.2219630032777786;0.4281989932060242;,
        0.2626770138740540;0.4662629961967468;,
        0.2626770138740540;0.1928960084915161;,
        0.4432370066642761;0.4281989932060242;,
        0.4432370066642761;0.2352330088615417;,
        0.4025230109691620;0.1928960084915161;,
        0.4025230109691620;0.4662629961967468;,
        0.2215040028095245;0.4269589781761169;,
        0.2215040028095245;0.0818570256233215;,
        0.1807900071144104;0.0382850170135498;,
        0.1807900071144104;0.4662629961967468;,
        0.0002300000051036;0.0818570256233215;,
        0.0002300000051036;0.4269589781761169;,
        0.0409439988434315;0.4662629961967468;,
        0.0409439988434315;0.0382850170135498;,
        0.9997699856758118;0.9997709989547729;,
        0.9997699856758118;0.9746710062026978;,
        0.9590560197830200;0.9671869874000549;,
        0.9590560197830200;0.9922869801521301;,
        0.7784960269927979;0.9746710062026978;,
        0.7784960269927979;0.9997709989547729;,
        0.8192099928855896;0.9922869801521301;,
        0.8192099928855896;0.9671869874000549;,
        0.4432370066642761;0.2352330088615417;,
        0.4432370066642761;0.2055879831314087;,
        0.4025230109691620;0.1632509827613831;,
        0.4025230109691620;0.1928960084915161;,
        0.2219630032777786;0.2055879831314087;,
        0.2219630032777786;0.2352330088615417;,
        0.2626770138740540;0.1928960084915161;,
        0.2626770138740540;0.1632509827613831;,
        0.7784960269927979;0.4582290053367615;,
        0.7784960269927979;0.5120469927787781;,
        0.8192099928855896;0.5021300315856934;,
        0.8192099928855896;0.4483109712600708;,
        0.9997699856758118;0.5120469927787781;,
        0.9997699856758118;0.4582290053367615;,
        0.9590560197830200;0.4483109712600708;,
        0.9590560197830200;0.5021300315856934;,
        0.4329349994659424;0.9997699856758118;,
        0.4329349994659424;0.9441519975662231;,
        0.3893629908561707;0.9441519975662231;,
        0.3893629908561707;0.9997699856758118;,
        0.0438020005822182;0.5223410129547119;,
        0.0438009984791279;0.4667220115661621;,
        0.0002300000051036;0.4667220115661621;,
        0.0002300000051036;0.5223410129547119;,
        0.7784960269927979;0.5460619926452637;,
        0.7784960269927979;0.5753369927406311;,
        0.8192099928855896;0.5654189586639404;,
        0.8192099928855896;0.5361440181732178;,
        0.9997699856758118;0.5753369927406311;,
        0.9997699856758118;0.5460619926452637;,
        0.9590560197830200;0.5361440181732178;,
        0.9590560197830200;0.5654189586639404;,
        0.4765009880065918;0.9250599741935730;,
        0.4908849895000458;0.9025689959526062;,
        0.4473130106925964;0.9025689959526062;,
        0.4329290091991425;0.9250599741935730;,
        0.1017519980669022;0.5639240145683289;,
        0.0873679965734482;0.5414329767227173;,
        0.0437959991395473;0.5414329767227173;,
        0.0581800006330013;0.5639240145683289;,
        0.7784960269927979;0.5753369927406311;,
        0.7784960269927979;0.9746710062026978;,
        0.8192099928855896;0.9671869874000549;,
        0.8192099928855896;0.5654189586639404;,
        0.9997699856758118;0.9746710062026978;,
        0.9997699856758118;0.5753369927406311;,
        0.9590560197830200;0.5654189586639404;,
        0.9590560197830200;0.9671869874000549;,
        0.4908849895000458;0.9025689959526062;,
        0.4543049931526184;0.5057410001754761;,
        0.4107330143451691;0.5089700222015381;,
        0.4473130106925964;0.9025689959526062;,
        0.0651720017194748;0.9607520103454590;,
        0.1017519980669022;0.5639240145683289;,
        0.0581800006330013;0.5639240145683289;,
        0.0216000005602837;0.9575219750404358;,
        0.7784960269927979;0.5120469927787781;,
        0.7784960269927979;0.5460619926452637;,
        0.8192099928855896;0.5361440181732178;,
        0.8192099928855896;0.5021300315856934;,
        0.9997699856758118;0.5460619926452637;,
        0.9997699856758118;0.5120469927787781;,
        0.9590560197830200;0.5021300315856934;,
        0.9590560197830200;0.5361440181732178;,
        0.6313779950141907;0.2449889779090881;,
        0.5840010046958923;0.2449889779090881;,
        0.6253110170364380;0.2857030034065247;,
        0.6726869940757751;0.2857030034065247;,
        0.5840010046958923;0.4662629961967468;,
        0.6313779950141907;0.4662629961967468;,
        0.6726869940757751;0.4255489706993103;,
        0.6253110170364380;0.4255489706993103;;
        }
      }

    }

  }

}
