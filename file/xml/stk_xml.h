#ifndef __stk_xml_h__
#define __stk_xml_h__
//---------------------------------------------------------------------------
// xml.h
// v.0x185
// revision 03 - 05 - 2018
//---------------------------------------------------------------------------
#include "../../mem/stk_mem.h"
// ANSI C std includes
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <assert.h>
// ANSI C
#include <ctype.h>
#define XML_VERSION 0x170
#define XML_VERSION_REVISION_DATE "30-05-2014"
#define CRYPT_OID_INFO_HAS_EXTRA_FIELDS
#define XML_OPTIONAL_MIME
// Always this, from now on
// #define XML_USE_STL
// #define ALLOW_SINGLE_QUOTE_VARIABLES
// Define the above tow allow var='x' instead of var="x"
//---------------------------------------------------------------------------
#ifdef LINUX
    #include <wchar.h>
#endif
#ifdef _WIN32
    #ifndef __SYMBIAN32__
    #include <windows.h>
#define WINCRYPT32API
    #include <wincrypt.h>
    #include <commctrl.h>
    #include <wininet.h>
    #include <tchar.h>
    #if WINVER >= 0x601
        #define CRYPT_OID_INFO_HAS_EXTRA_FIELDS
        #include <cryptxml.h>
    #endif
    #endif
#endif
#ifdef __SYMBIAN32__
    #define _USERENTRY
    #define strcmpi strcmp
    #include <unistd.h>
#endif
#ifdef __unix
    #define LINUX
#endif
#ifdef __APPLE__
    #define LINUX
#endif
#ifdef LINUX
    #define _USERENTRY
    #define __cdecl
#endif
//---------------------------------------------------------------------------
#ifdef __BORLANDC__
    #pragma warn -pck
#endif
#ifdef _MSC_VER
    #define _USERENTRY __cdecl
#endif
#ifdef __WATCOMC__
    #define _USERENTRY
#endif
#ifdef __GNUC__
    #define _USERENTRY
    //#define strcpy_s(a,b,c) strcpy(a,c)
    //#define strncat_s(a,b,c,d) strncat(a,c,d)
#endif
//---------------------------------------------------------------------------
#ifdef XML_USE_STL
    #define XML_USE_STL_EXTENSIONS
    #include <vector>
    #include <string>
    #include <algorithm>
#endif
//---------------------------------------------------------------------------
#ifndef _Z_H
#define _Z_H
// Z template class
template <class T>class Z
    {
    private:

        T* d;
        size_t ss;

    public:

        Z(size_t s = 0)
            {
            if (s == 0)
                s = 1;
            d = new T[s];
            stk::mem::set(d,0,s*sizeof(T));
            ss = s;
            }
        ~Z()
            {
            delete[] d;
            }

        operator T*()
            {
            return d;
            }

        T* p()
            {
            return d;
            }

        size_t bs()
            {
            return ss*sizeof(T);
            }

        size_t is()
            {
            return ss;
            }

        void _clear()
            {
            stk::mem::set(d,0,ss*sizeof(T));
            }

        void Resize(size_t news)
            {
            if (news == ss)
                return; // same size

            // Create buffer to store existing data
            T* newd = new T[news];
            size_t newbs = news*sizeof(T);
            stk::mem::set((void*)newd,0, newbs);

            if (ss < news)
                // we created a larger data structure
                stk::mem::mov((void*)newd,d,ss*sizeof(T));
            else
                // we created a smaller data structure
                stk::mem::mov((void*)newd,d,news*sizeof(T));
            delete[] d;
            d = newd;
            ss = news;
            }

        void AddResize(size_t More)
            {
            Resize(ss + More);
            }

    };
#endif // Z_H
//---------------------------------------------------------------------------
// Binary Data Container
//---------------------------------------------------------------------------
class BDC
    {
    public:
        char* d;
        unsigned __int64 ss;

        BDC(unsigned __int64 s);
        BDC();
        ~BDC();
        BDC(const BDC& d2);
        void operator =(const BDC& d2);
        bool operator ==(const BDC& b2);
        operator char*() const;
        operator const char*() const;
        char* p() const;
        unsigned __int64 size() const;
        void clear();
        void reset();
        void Ensure(unsigned __int64 news);
        void Resize(unsigned __int64 news);
        void AddResize(unsigned __int64 More);
    };
/*
    Binary Exporting Stuff

    int (4)             : Version of the exporter, currently 0
    int (4)             : Type (0 xml,1 header, 2 element, 3 variable, 4 comment, 5 cdata, 6 content)
    int (4)             : Version of the specific type exporter, currently 0
    int (4)             : Total size of the binary data following
    <...>               : Data

*/
//---------------------------------------------------------------------------
#pragma pack(push,8)
struct XMLBINARYHEADER
    {
    int v;
    int t;
    int tv;
    int s;
    };
#pragma pack(pop)
//---------------------------------------------------------------------------
#ifdef XML_USE_NAMESPACE
namespace XMLPP
    {
#endif
//---------------------------------------------------------------------------
// XMLU Class, converts utf input to wide char and vice versa
//---------------------------------------------------------------------------
class XMLU
    {
    public:
        char bempty[2];
        wchar_t wempty[2];

        char* bs;
        wchar_t* ws;
        bool n;
        XMLU(const char* x)
            {
            stk::mem::set(bempty,0,sizeof(bempty));
            stk::mem::set(wempty,0,sizeof(wempty));
            bs = 0;
            ws = 0;
            n = false;
            if (!x || !strlen(x))
                {
                bs = bempty;
                ws = wempty;
                }
            else
                {
                n = true;
                size_t si = strlen(x)*2 + 1000;
                ws = new wchar_t[si];
                bs = new char[si];
                stk::mem::set((void*)ws,0,si*sizeof(wchar_t));
                stk::mem::set((void*)bs,0,si*sizeof(char));
#ifdef _WIN32
                lstrcpyA(bs,x);
                MultiByteToWideChar(CP_UTF8,0,x,-1,ws,(int)si);
#endif
                }
            }
        XMLU(const wchar_t* x)
            {
            // ugh... forgot that earlier.
            stk::mem::set(bempty,0,sizeof(bempty));
            stk::mem::set(wempty,0,sizeof(wempty));
            bs = 0;
            ws = 0;
            n = false;
            if (!x || !wcslen(x))
                {
                bs = bempty;
                ws = wempty;
                }
            else
                {
                n = true;
                size_t si = wcslen(x)*2 + 1000;
                ws = new wchar_t[si];
                bs = new char[si];
                stk::mem::set((void*)ws,0,si*sizeof(wchar_t));
                stk::mem::set((void*)bs,0,si*sizeof(char));
#ifdef _WIN32
                lstrcpyW(ws,x);
                WideCharToMultiByte(CP_UTF8,0,x,-1,bs,(int)si,0,0);
#endif
                }
            }
        wchar_t* wc()
            {
            return ws;
            }
        char* bc()
            {
            return bs;
            }
        operator wchar_t*()
            {
            return ws;
            }
        operator char*()
            {
            return bs;
            }
        ~XMLU()
            {
            if (n)
                {
                if (ws)
                    delete[] ws;
                if (bs)
                    delete[] bs;
                }
            }
    };
//---------------------------------------------------------------------------
class XMLHeader;
class XMLElement;
class XMLVariable;
class XMLComment;
class XMLContent;
class XMLCData;
class XML;
//---------------------------------------------------------------------------
typedef struct
    {
    int VersionHigh;
    int VersionLow;
    char RDate[20];
    } XML_VERSION_INFO;
//---------------------------------------------------------------------------
#ifdef _WIN32
struct IMPORTDBTABLEDATA
    {
    char name[256];
    char itemname[100];
    int nVariables;
    char** Variables;
    char** ReplaceVariables;
    };
//---------------------------------------------------------------------------
struct IMPORTDBPARAMS
    {
    char* dbname;
    char* provstr;
    int nTables;
    IMPORTDBTABLEDATA* Tables;
    };
#endif
//---------------------------------------------------------------------------
struct XMLEXPORTFORMAT
    {
    bool UseSpace;
    int nId;
    bool ElementsNoBreak;
    bool ContentsNoBreak;
    };
//---------------------------------------------------------------------------
#ifdef _WIN32
struct IMPORTRKEYDATA
    {
    HKEY pK;
    int StorageType; // 0 - Native
    // 1 - Registry key from native XML
    // 2 - Registry key from registry XML
    };
#endif
//---------------------------------------------------------------------------
// UNLOAD elements
#ifdef XML_USE_STL
#else
struct XMLUNLOADELEMENT
    {
    int i;
    char* fn[300];
    };
#endif
//---------------------------------------------------------------------------
// Enumerations
enum XML_LOAD_MODE
    {
    XML_LOAD_MODE_LOCAL_FILE = 0,
    XML_LOAD_MODE_MEMORY_BUFFER = 1,
    XML_LOAD_MODE_URL = 2,
    XML_LOAD_MODE_LOCAL_FILE_U = 7,
    };
//---------------------------------------------------------------------------
enum XML_PARSE_STATUS
    {
    XML_PARSE_OK = 0,
    XML_PARSE_NO_HEADER = 1,
    XML_PARSE_ERROR = 2,
    };
//---------------------------------------------------------------------------
enum XML_SAVE_MODE
    {
    XML_SAVE_MODE_ZERO = 0,
    XML_SAVE_MODE_DEFAULT = 1,
    };
//---------------------------------------------------------------------------
enum XML_TARGET_MODE
    {
    XML_TARGET_MODE_FILE = 0,
    XML_TARGET_MODE_MEMORY = 1,
    XML_TARGET_MODE_REGISTRYKEY = 2,
    XML_TARGET_MODE_UTF16FILE = 3,
    };
//---------------------------------------------------------------------------
// Global functions
//---------------------------------------------------------------------------
class XMLHeader
    {
    public:
        // constructors/destructor
        XMLHeader(const char* ht = 0,const wchar_t* wht = 0);
        operator const char*();
        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
#ifdef XML_USE_STL
        int Compare(XMLHeader&);
#else
        int Compare(XMLHeader*);
#endif
        void SetEncoding(const char*);
        XMLHeader* Duplicate();

        XMLHeader(XMLHeader&);
        XMLHeader& operator =(XMLHeader&);
        ~XMLHeader();
        // XMLComment
#ifdef XML_USE_STL
        vector<XMLComment>& GetComments();
        unsigned int GetCommentsNum();
        XMLComment& AddComment(const char*,int pos = -1,const wchar_t* wt = 0);
        XMLComment& AddComment(const XMLComment&);
        int RemoveComment(unsigned int i);
        int RemoveAllComments();
        const string& GetH1() {return hdr1;}
        const string& GetH2() {return hdr2;}
#else
        XMLComment** GetComments();
        unsigned int GetCommentsNum();
        int AddComment(XMLComment*,int pos);
        int RemoveComment(unsigned int i);
        int RemoveAllComments();
        int SpaceForComment(unsigned int);
        const char* GetH1() {return hdr1;}
        const char* GetH2() {return hdr2;}
#endif
        void Export(FILE* fp,int HeaderMode,XML_TARGET_MODE TargetMode = XML_TARGET_MODE_FILE,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0);

#ifdef XML_USE_STL
        string& GetHeader() {return hdr1;}
#endif

        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);

        void SetH1(const char* txt,const wchar_t* wtxt = 0);
        void SetH2(const char* txt,const wchar_t* wtxt = 0);

    private:

        void Clear();
#ifdef XML_USE_STL
        string hdr1;
        string hdr2;
        vector<XMLComment> comments;
#else
        int TotalCommentPointersAvailable;
        char* hdr1;
        char* hdr2;
        unsigned int commentsnum;
        XMLComment** comments;
#endif
    };
//---------------------------------------------------------------------------
#ifdef LINUX
typedef int (*fcmp) (const void *, const void *);
#endif
//---------------------------------------------------------------------------
#ifdef XML_USE_STL
#else
struct XMLBORROWELEMENT
    {
    bool Active;
    class XMLElement* x;
    };
#endif
//---------------------------------------------------------------------------
class XMLElement
    {
    public:
        // constructors/destructor
        XMLElement(XMLElement* par = 0,const char* el = 0,int Type = 0,bool Temp = false,const wchar_t* wel = 0);
        //XMLElement& operator =(XMLElement&);
        ~XMLElement();

        void Clear();
#ifdef XML_USE_STL
        // STL Functions
        XMLElement& operator[](int);
        XMLElement& AddElement(const char*,int p = -1,bool Temp = false,const wchar_t* = 0);
        XMLElement& AddElement(const XMLElement&,int p = -1);
        XMLElement& InsertElement(unsigned int y,XMLElement* x);
#else
        // No STL Functions
        XMLElement* operator[](int);
        XMLElement* AddElement(XMLElement*);
        XMLElement* AddElement(const char*,const wchar_t* = 0);
        XMLElement* InsertElement(unsigned int,XMLElement*);
#endif
        void SetElementParam(unsigned __int64 p);
        unsigned __int64 GetElementParam();
        void Reparse(const char*el,int Type = 0);
        int GetDeep();

#ifdef XML_USE_STL
        int RemoveElementAndKeep(unsigned int i,XMLElement** el);
#else
        int BorrowElement(XMLElement*,unsigned int = (unsigned)-1);
        int ReleaseBorrowedElements();
        int RemoveElementAndKeep(unsigned int i,XMLElement** el);
#endif

        bool ReplaceElement(unsigned int i,XMLElement* ne,XMLElement** prev = 0);
        int UpdateElement(XMLElement*,bool UpdateVariableValues = false);
        int FindElement(XMLElement*);
        int FindElement(const char* n);
        XMLElement* elm(const char* n);
        XMLElement* FindElementZ(XMLElement*);
        XMLElement* FindElementZ(const char* n,bool ForceCreate = false,char* el = 0,bool Temp = false);
        XMLElement* FindElementWithVariableValue(const char*vn,const char* vv);
        int RemoveElement(unsigned int i);
        int GetElementIndex(XMLElement*);
        int GetDeepLevel();

        bool EncryptElement(unsigned int i,char* pwd);
        bool DecryptElement(unsigned int i,char* pwd);

#ifdef _WIN32
#ifndef WINCE
        bool SignElement(unsigned int i,PCCERT_CONTEXT pCert);
        XMLVariable* GetSignature(unsigned int i);
        bool RemoveSignature(unsigned int i);
        bool VerifyDigitalSignature(unsigned int i,PCCERT_CONTEXT* ppCert);
        XMLElement* EncryptElement(unsigned int i,PCCERT_CONTEXT* pCert,int nCert);
        XMLElement* DecryptElement(unsigned int i,PCCERT_CONTEXT* ppCert);
#endif
#endif
        int RemoveElement(XMLElement*);
        int RemoveAllElements();
        int RemoveTemporalElements(bool Deep = false);
        int DeleteUnloadedElementFile(int i);

#ifdef XML_USE_STL
#else
        int UnloadElement(unsigned int i);
        int ReloadElement(unsigned int i);
        int ReloadAllElements();
#endif
        XMLElement* MoveElement(unsigned int i,unsigned int y);

#ifdef XML_USE_STL
        void SortElements();
        void SortVariables();
        bool operator <(const XMLElement&);
#else
#ifdef LINUX
        void SortElements(fcmp);
        void SortVariables(fcmp);
        friend int XMLElementfcmp(const void *, const void *);
        friend int XMLVariablefcmp(const void *, const void *);
#else
        void SortElements(int (_USERENTRY *fcmp)(const void *, const void *));
        void SortVariables(int (_USERENTRY *fcmp)(const void *, const void *));
        friend int _USERENTRY XMLElementfcmp(const void *, const void *);
        friend int _USERENTRY XMLVariablefcmp(const void *, const void *);
#endif
#endif
        XMLElement* Duplicate(XMLElement* = 0);
        XMLElement* Encrypt(const char* pwd);
        XMLElement* Decrypt(const char* pwd);
        XMLElement* Next();
        XMLElement* Prev();
        bool Discard();

        void Copy();
#ifdef XML_USE_STL
        string GetString();
#endif
        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
#ifdef XML_USE_STL
        int Compare(XMLElement&);
#else
        int Compare(XMLElement*);
#endif
        // XMLComment
#ifdef XML_USE_STL
        vector<XMLComment>& GetComments();
        XMLComment& AddComment(const char*,int,const wchar_t* = 0);
        XMLComment& AddComment(const XMLComment&);
#else
        XMLComment** GetComments();
        int AddComment(XMLComment*,int InsertBeforeElement);
        int AddComment(const char*,int,const wchar_t* = 0);
#endif
        unsigned int GetCommentsNum();
        int RemoveComment(unsigned int i);
        int RemoveAllComments();

        // XMLCData
#ifdef XML_USE_STL
        vector<XMLCData>& GetCDatas();
        XMLCData& AddCData(const char*,int,const wchar_t* wt = 0);
        XMLCData& AddCData(const XMLCData&);
#else
        XMLCData** GetCDatas();
        int AddCData(XMLCData*,int InsertBeforeElement);
        int AddCData(const char*,int,const wchar_t* wt = 0);
#endif
        unsigned int GetCDatasNum();
        int RemoveCData(unsigned int i);
        int RemoveAllCDatas();

        // Content Stuff
        int GetIndexInParent();
#ifdef XML_USE_STL_EXTENSIONS
        string GetContent();
        XMLElement* ElementFromLocationString(const char* str);
        string GetUniqueLocationString();
        void SetContent(const char* c);
        string VariableValue(const char* vn,const char* def = "");
#endif

#ifdef XML_USE_STL
        vector<XMLContent>& GetContents();
        XMLContent& AddContent(const char*,int,int BinarySize = 0,const wchar_t* = 0);
        XMLContent& AddContent(const XMLContent&);
#else
        XMLContent** GetContents();
        int AddContent(XMLContent* v,int InsertBeforeElement);
        int AddContent(const char*,int,int BinarySize = 0,const wchar_t* = 0);
#endif
        int RemoveContent(unsigned int i);
        void RemoveAllContents();
        unsigned int GetContentsNum();

        // Children Stuff
#ifdef XML_USE_STL
        vector<XMLElement>& GetChildren();
#else
        XMLElement** GetChildren();
#endif
        unsigned int GetChildrenNum();
        unsigned int GetAllChildren(XMLElement**,unsigned int deep = 0xFFFFFFFF);
        unsigned int GetAllChildrenNum(unsigned int deep = 0xFFFFFFFF);

        // Variable Stuff
#ifdef XML_USE_STL
        int RemoveVariableAndKeep(unsigned int i,XMLVariable* vr);
        vector<XMLVariable>& GetVariables();
        XMLVariable& AddVariable(const XMLVariable&,int p = -1);
        XMLVariable& AddVariable(const char*,const char*,int p = -1,bool Temp = false,const wchar_t* = 0,const wchar_t* = 0);
#ifdef XML_OPTIONAL_MIME
        XMLVariable& AddBinaryVariable(const char*,const char*,int);
#endif
#else
        int AddVariable(XMLVariable*);
        int RemoveVariableAndKeep(unsigned int i,XMLVariable** vr);
        XMLVariable** GetVariables();
        int AddVariable(const char*,const char*,const wchar_t* = 0,const wchar_t* = 0);
#ifdef XML_OPTIONAL_MIME
        int AddBinaryVariable(const char*,const char*,int);
#endif
#endif

        XMLVariable* SetValue(const char* vn,const char* vv);
        int FindVariable(XMLVariable*);
        int FindVariable(const char*  x);
        XMLVariable* FindVariableZ(XMLVariable*);
        XMLVariable* FindVariableZ(const char* x,bool ForceCreate = false,const char* defnew = 0,bool Temp = false);
        int RemoveVariable(unsigned int i);
        int RemoveVariable(XMLVariable*);
        int RemoveAllVariables();
        int RemoveTemporalVariables(bool Deep = false);
        unsigned int GetVariableNum();

        XMLElement* GetElementInSection(const char*);
        int XMLQuery(const char* expression,XMLElement** rv,unsigned int deep = 0xFFFFFFFF);
        XMLElement* GetParent();
        void Export(FILE* fp,int ShowAll,XML_SAVE_MODE SaveMode,XML_TARGET_MODE TargetMode = XML_TARGET_MODE_FILE,XMLHeader* hdr = 0,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0);
        void SetExportFormatting(XMLEXPORTFORMAT* xf);
        void SetElementName(const char*,const wchar_t* = 0);
        size_t GetElementName(char*,int NoDecode = 0);
        size_t GetElementFullName(char*,int NoDecode = 0);
        size_t GetElementUniqueString(char*);
        void SetTemporal(bool);
        bool IsTemporal();
        int   GetType();
        static void Write16String(FILE* fp,const char* s);
        int ReserveSpaceForElements(unsigned int);
#ifdef XML_USE_STL
        XMLElement(const XMLElement&);
        XMLElement(const XMLElement*);
        XMLElement& operator =(const XMLElement&);
        XMLElement& operator =(const XMLElement*);
#endif

        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);

#ifdef XML_USE_STL_EXTENSIONS
        string Serialize();
        string GetElementNameS(int NoDecode = 0);
#endif

    private:

#ifndef XML_USE_STL
        XMLElement(const XMLElement&);
#endif
        unsigned __int64 param;
        int type; // type, 0 element
        XMLElement* parent; // one

#ifdef XML_USE_STL
        string el; // element name
        vector<XMLElement> children; // many
        vector<XMLVariable> variables; // many
        vector<XMLComment> comments; // many
        vector<XMLContent> contents; // many;
        vector<XMLCData> cdatas; // many
#else
        char* el; // element name
        XMLElement** children; // many
        XMLVariable** variables; // many
        XMLComment** comments; // many
        XMLContent** contents; // many;
        XMLCData** cdatas;
        unsigned int childrennum;
        unsigned int variablesnum;
        unsigned int commentsnum;
        unsigned int contentsnum;
        unsigned int cdatasnum;
        int SpaceForElement(unsigned int);
        int SpaceForVariable(unsigned int);
        int SpaceForComment(unsigned int);
        int SpaceForContent(unsigned int);
        int SpaceForCData(unsigned int);
        int TotalChildPointersAvailable;
        int TotalVariablePointersAvailable;
        int TotalCommentPointersAvailable;
        int TotalContentPointersAvailable;
        int TotalCDataPointersAvailable;
#endif
        bool Temporal;
#ifdef XML_USE_STL
#else
        Z<XMLBORROWELEMENT> BorrowedElements;
        unsigned int NumBorrowedElements;
#endif
        XMLEXPORTFORMAT xfformat;
        static void printc(FILE* fp,XMLElement* root,int deep,int ShowAll,XML_SAVE_MODE SaveMode,XML_TARGET_MODE TargetMode);
        void SetParent(XMLElement*);
    };
//---------------------------------------------------------------------------

class XMLVariable
    {
    public:
        XMLVariable(const char* = 0,const char* = 0,int NoDecode = 0,bool Temp = false,const wchar_t* = 0,const wchar_t* = 0);
        ~XMLVariable();
        XMLVariable(const XMLVariable&);
        XMLVariable& operator =(const XMLVariable&);

        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
#ifdef XML_USE_STL
        bool operator <(const XMLVariable&);
        int Compare(XMLVariable&);
#else
        int Compare(XMLVariable*);
#endif
        XMLElement* SetOwnerElement(XMLElement*);
        size_t GetName(char*,int NoDecode = 0) const;
        size_t GetValue(char*,int NoDecode = 0) const;
#ifdef XML_USE_STL_EXTENSIONS
        string GetNameS();
        string GetValueS();
#endif
        int GetValueInt();
        unsigned int GetValueUInt();
        __int64 GetValueInt64();
        unsigned __int64 GetValueUInt64();
        float GetValueFloat();
        void SetName(const char*,int NoDecode = 0,const wchar_t* = 0);
        void SetValue(const char*,int NoDecode = 0,const wchar_t* = 0);
        void SetValueUInt(unsigned int);
        void SetValueInt(int);
        void SetValueInt64(__int64);
        void SetValueUInt64(unsigned __int64);
        void SetValueFloat(float);
        void SetFormattedValue(const char* fmt,...);
        template <typename T> T GetFormattedValue(const char* fmt)
            {
            size_t p = GetValue(0);
            Z<char> d(p + 10);
            GetValue(d);
            T x = 0;
            sscanf_s(d,fmt,&x);
            return x;
            }
        template <typename T> void SetValueX(T t,const char* fmt);
        template <typename T> T GetValueX(const char* fmt);
        XMLVariable* Duplicate();
        void Copy();
        XMLElement* GetOwnerElement();
        void SetTemporal(bool);
        bool IsTemporal();

#ifdef XML_OPTIONAL_MIME
        size_t GetBinaryValue(char*);
        size_t SetBinaryValue(char*,int);
#endif
        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);
    private:
        void Clear();
#ifdef XML_USE_STL
        string vn;
        string vv;
#else
        char* vn;
        char* vv;
#endif
        XMLElement* owner;
        bool Temporal;
    };
//---------------------------------------------------------------------------

class XMLComment
    {
    public:
        // constructors/destructor
        XMLComment(XMLElement* p = 0,int ElementPosition = -1,const char* ht = 0,const wchar_t* wt = 0);
        operator const char*() const;
        void SetComment(const char* ht);
        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
#ifdef XML_USE_STL
        int Compare(XMLComment&);
#else
        int Compare(XMLComment*);
#endif
        XMLComment(const XMLComment&);
        XMLComment& operator =(const XMLComment&);
        ~XMLComment();

        XMLComment* Duplicate();
        void SetParent(XMLElement* p,int ep);
        int GetEP() const;

        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);
    private:
        XMLElement* parent;
#ifdef XML_USE_STL
        string c;
#else
        char* c;
#endif
        int ep; // Element Position (Before)
    };
//---------------------------------------------------------------------------
class XMLContent
    {
    public:
        // constructors/destructor
        XMLContent(XMLElement* p = 0,int ElementPosition = -1,const char* ht = 0,int NoDecode = 0,int BinarySize = 0,const wchar_t* wt = 0);
//              operator const char*();
        size_t GetValue(char*,int NoDecode = 0) const;
        bool GetBinaryValue(char**o,unsigned int* len);
        void SetValue(const char*,int NoDecode = 0,int BinarySize = 0);
        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
#ifdef XML_USE_STL
        int Compare(XMLContent&);
#else
        int Compare(XMLContent*);
#endif

#ifdef XML_USE_STL_EXTENSIONS
        string GetValueS();
#endif
        XMLContent(const XMLContent&);
        XMLContent& operator =(const XMLContent&);
        ~XMLContent();

        XMLContent* Duplicate();
        void SetParent(XMLElement* p,int ep);
        int GetEP() const;
        void SetBinaryMode(bool bm);
        bool IsInBinaryMode() const;

        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);
    private:
        XMLElement* parent;
        BDC bdc; // Binary Data Container
        bool BinaryMode;

#ifdef XML_USE_STL
        string c;
#else
        char* c;
#endif
        int ep; // Element Position (Before)
    };
//---------------------------------------------------------------------------

class XMLCData
    {
    public:
        // constructors/destructor
        XMLCData(XMLElement* p = 0,int ElementPosition = -1,const char* ht = 0,const wchar_t* wt = 0);
        operator const char*() const;
        void SetCData(const char* ht);
        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
#ifdef XML_USE_STL
        int Compare(XMLCData&);
#else
        int Compare(XMLCData*);
#endif
        XMLCData(const XMLCData&);
        XMLCData& operator =(const XMLCData&);
        ~XMLCData();

        XMLCData* Duplicate();
        void SetParent(XMLElement* p,int ep);
        int GetEP() const;

        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);
    private:
        XMLElement* parent;
#ifdef XML_USE_STL
        string c;
#else
        char* c;
#endif
        int ep; // Element Position (Before)
    };
//---------------------------------------------------------------------------
class XML
    {
    public:
        // constructors/destructor
        XML();
        XML(const char* file,XML_LOAD_MODE LoadMode = XML_LOAD_MODE_LOCAL_FILE,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0);
#ifndef LINUX
        XML(const wchar_t* file,XML_LOAD_MODE LoadMode = XML_LOAD_MODE_LOCAL_FILE,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0);
#endif
        void Version(XML_VERSION_INFO*);
        size_t MemoryUsage();
        void CompressMemory();
        bool IntegrityTest();
        int Compare(XML*);

        XML(XML& x);
        XML& operator =(XML&);
        ~XML();
        //      static void Kill(char* tf);
#ifdef LINUX
        int PhantomLoad(const char* file);
#else
        int PhantomLoad(const char* file,bool IsUnicode = false,bool UseMap = false);
#endif
        int PhantomElement(FILE*fp,class XMLElement* r,unsigned __int64 StartP,unsigned __int64 EndP);
        static int DoMatch(const char *text, char *p, bool IsCaseSensitive = false);
        static bool VMatching(const char *text, char *p, bool IsCaseSensitive = false);
        static bool TestMatch(const char* item1,const char* comp,const char* item2);
        static Z<char>* ReadToZ(const char*,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0,bool IsU = 0);
        static int Convert2HexCharsToNumber(int c1, int c2);
        static XMLElement* Paste(char* txt = 0);
#ifdef XML_USE_STL
#else
        static void JsonParser(XMLElement* root,const char* txt);
#endif
        XML_PARSE_STATUS ParseStatus(int* = 0);
        void SetUnicode(bool x);
        void SaveOnClose(bool);
        int Load(const char* data,XML_LOAD_MODE LoadMode = XML_LOAD_MODE_LOCAL_FILE,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0);
        size_t LoadText(const char*);
        size_t LoadText(const wchar_t*);
        static int PartialLoad(const char* file,const char* map);
        static XMLElement * PartialElement(const char* file,const char* map);
        int Save(const char* file = 0,XML_SAVE_MODE SaveMode = XML_SAVE_MODE_DEFAULT,XML_TARGET_MODE TargetMode = XML_TARGET_MODE_FILE,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0); // Default, do not encode already encoded
        void Export(FILE* fp,XML_SAVE_MODE SaveMode,XML_TARGET_MODE TargetMode = XML_TARGET_MODE_FILE,XMLHeader *hdr = 0,class XMLTransform* eclass = 0,class XMLTransformData* edata = 0);
        void SetExportFormatting(XMLEXPORTFORMAT* xf);
        void Lock(bool);
        int RemoveTemporalElements();
#ifdef XML_OPTIONAL_IMPORTDB
        static XMLElement* ImportDB(IMPORTDBPARAMS* );
#endif
#ifdef XML_OPTIONAL_IMPORTRKEY
        static XMLElement* ImportRKey(IMPORTRKEYDATA*);
#endif
#ifdef XML_USE_STL
        void SetRootElement(XMLElement&);
        XMLElement RemoveRootElementAndKeep();
        XMLElement& GetRootElement();
        XMLHeader& GetHeader();
        void SetHeader(XMLHeader& h);
#else
        void SetRootElement(XMLElement*);
        XMLElement* RemoveRootElementAndKeep();
        XMLElement* GetRootElement() const;
        XMLHeader* GetHeader();
        void SetHeader(XMLHeader* h);
#endif
        static size_t XMLEncode(const char* src,char* trg);
        static size_t XMLDecode(const char* src,char* trg);
        size_t XMLGetValue(const char* section,const char* attr,char* put,size_t maxlen);
        void XMLSetValue(const char* section,const char* attr,char* put);
        BDC ExportToBinary();
        bool ImportFromBinary(const BDC&);
        // Query functions
        int XMLQuery(const char* rootsection,const char* expression,XMLElement** rv,unsigned int deep = 0xFFFFFFFF);
    private:
        void Init();
        void Clear();
        XML_PARSE_STATUS iParseStatus; // 0 Valid , 1 Error but recovered, 2 fatal error
        int iParseStatusPos;
#ifndef LINUX
        bool IsFileU; // unicode file
#endif
#ifdef XML_USE_STL
        string f;          // filename
        XMLHeader hdr;
        XMLElement _root;
#else
        char* f;          // filename
        XMLHeader* hdr;   // header (one)
        XMLElement* root; // root element (one)
#endif
        bool SOnClose;
        // For Windows
    };
//---------------------------------------------------------------------------
// public functions
//---------------------------------------------------------------------------
size_t              XMLGetString(const char* section,const char* Tattr,const char* defv,char*out,const size_t maxlen,const char* xml,XML* af = 0);
int                 XMLSetString(const char* section,const char* Tattr,char*out,const char* xml,XML* af = 0);
int                 XMLGetInt(const char* item,const char* attr,const int defv,const char* xml,XML* af = 0);
int                 XMLSetInt(const char* section,const char* attr,int v,const char* xml,XML* af = 0);
unsigned int        XMLGetUInt(const char* item,const char* attr,const unsigned int defv,const char* xml,XML* af = 0);
int                 XMLSetUInt(const char* section,const char* attr,unsigned int v,const char* xml,XML* af = 0);
float               XMLGetFloat(const char* item,const char* attr,const float defv,const char* xml,XML* af = 0);
int                 XMLSetFloat(const char* section,const char* attr,float v,const char* xml,XML* af = 0);
size_t              XMLGetBinaryData(const char* item,const char* attr,const char* defv,char*out,const size_t maxlen,const char* xml,XML* af = 0);
int                 XMLSetBinaryData(const char* section,const char* attr,char* data,int len,const char* xml,XML* af = 0);
int                 XMLRenameElement(const char* section,const char* newname,const char* xml,XML* af = 0);
#ifdef _WIN32
__int64           XMLGetInt64(const char* item,const char* attr,const __int64 defv,const char* xml,XML* af = 0);
int                 XMLSetInt64(const char* section,const char* attr,__int64 v,const char* xml,XML* af = 0);
unsigned __int64  XMLGetUInt64(const char* item,const char* attr,const unsigned __int64 defv,const char* xml,XML* af = 0);
int                 XMLSetUInt64(const char* section,const char* attr,unsigned __int64 v,const char* xml,XML* af = 0);
int                 XMLSetStringW(const char* section,const char* Tattr,wchar_t*out,const char* xml,XML* af = 0);
#if !defined(__BORLANDC__) && !defined(__WATCOMC__)
#define             XMLSetStringA(...) XMLSetString(__VA_ARGS__)
#endif
#endif
#ifndef __SYMBIAN32__
#ifdef XML_USE_STL
int                 XMLGetAllVariables(const char* section,vector<char*>* vnames,vector<char*>* vvalues,const char*xml);
int                 XMLGetAllItems(const char* section,vector<char*>* vnames,const char*xml);
#else
int                 XMLGetAllVariables(const char* section,char** vnames,char** vvalues,const char*xml);
int                 XMLGetAllItems(const char* section,char** vnames,const char*xml);
#endif
#endif
//---------------------------------------------------------------------------
// XMLTransform class
//---------------------------------------------------------------------------
class XMLTransformData
    {
    public:
        XMLTransformData() {}
    };
//---------------------------------------------------------------------------
class XMLTransform
    {
    public:
        XMLTransform(XMLTransformData*) { }
        virtual ~XMLTransform() {}
        virtual size_t Encrypt(const char*src,size_t srclen,int srctype,char* dst,size_t dstlen,XMLTransformData* data = 0) = 0;
        virtual size_t Decrypt(const char*src,size_t srclen,int srctype,char* dst,size_t dstlen,XMLTransformData* data = 0) = 0;
    };
//---------------------------------------------------------------------------

class XMLHelper
    {
    public:
        // static functions
        static char* FindXMLClose(char* s);
#ifdef XML_USE_STL
        static XMLElement* ParseElementTree(XMLHeader* hdr,XMLElement* parent,char* tree,char** EndValue,XML_PARSE_STATUS& iParseStatus,vector<XMLElement*>* RootElements);
#else
        static XMLElement* ParseElementTree(XMLHeader* hdr,XMLElement* parent,char* tree,char** EndValue,XML_PARSE_STATUS& iParseStatus);
#endif
        static void AddBlankVariable(XMLElement* parent,char *a2,int Pos);
        static int pow(int P,int z);
    };
//---------------------------------------------------------------------------
#ifdef XML_USE_NAMESPACE
};
#endif
//---------------------------------------------------------------------------
#endif // _XML_H
//---------------------------------------------------------------------------
