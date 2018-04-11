//---------------------------------------------------------------------------
// ------ Stanislaw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "stk_time.h"
#include "./../mem/stk_mem.h"
#include "./../text/stk_cstr_utils.h"
#include  <time.h>
//---------------------------------------------------------------------------

uint64_t __stdcall stk::time::time_us(void)
// cross-platform timeGetTime (on Windows minimum return is 1000us, on linux there is us acuracy (probably?) CLOCKS_PER_SEC >=1M
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
                clock_t c = ::clock();
                register uint64_t r = 1000000 * c;
                r = r / CLOCKS_PER_SEC;
        r = (uint64_t)r % 1000000;
        r = r + (1000000 * ::time(NULL));
                return r;
}
//---------------------------------------------------------------------------

uint64_t __stdcall stk::time::time_ms(void) // cross-platform timeGetTime
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
        return time_us() / 1000;
}
//---------------------------------------------------------------------------

void __stdcall stk::time::wait_ms(const uint64_t milliseconds) // cross-platform sleep function
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
	            #ifdef __WIN32__
				register uint64_t ms = milliseconds;
				for (; ms > 0x3FFFFFFF; ms-=0x3FFFFFFF) ::Sleep(0x3FFFFFFF);
				::Sleep((DWORD)ms);
                #else
                _usleep(milliseconds * 1000);
                #endif // win32
}
//---------------------------------------------------------------------------

/*
static NTSTATUS(__stdcall *NtDelayExecution)(BOOL Alertable, PLARGE_INTEGER DelayInterval) = (NTSTATUS(__stdcall*)(BOOL, PLARGE_INTEGER)) GetProcAddress(GetModuleHandle("ntdll.dll"), "NtDelayExecution");
static NTSTATUS(__stdcall *ZwSetTimerResolution)(IN ULONG RequestedResolution, IN BOOLEAN Set, OUT PULONG ActualResolution) = (NTSTATUS(__stdcall*)(ULONG, BOOLEAN, PULONG)) GetProcAddress(GetModuleHandle("ntdll.dll"), "ZwSetTimerResolution");

static void sleep_us(double microseconds) {
    static bool once = true;
    if (once) {
        ULONG actualResolution;
        ZwSetTimerResolution(1, true, &actualResolution);
        once = false;
    }

    LARGE_INTEGER interval;
    interval.QuadPart = -1 * (int)(milliseconds * 10000.0f);
    NtDelayExecution(false, &interval);
}
*/


void __stdcall stk::time::wait_us(const uint64_t microseconds) // cross-platform sleep function
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
                #ifdef __WIN32__
				register uint64_t ms = microseconds / 1000;
				for (; ms > 0x3FFFFFFF; ms-=0x3FFFFFFF) ::Sleep(0x3FFFFFFF);
				::Sleep((DWORD)ms);
                //MSDN: A value of zero causes the thread to relinquish the remainder of its time slice to any other thread that is ready to run
                #else
        struct timespec req,rem;
        req.tv_sec = microseconds / 1 000 000; req.tv_nsec = (microseconds % 100 000) * 1000;
                while (nanosleep(&req,&rem);
                #endif // win32
}
//---------------------------------------------------------------------------

void __stdcall stk::time::wait_until(const time_t a_time)
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
        time_t f_current_time = ::time(NULL);
                #ifdef __WIN32__
                ::Sleep(difftime(f_current_time,a_time));
                //MSDN: A value of zero causes the thread to relinquish the remainder of its time slice to any other thread that is ready to run
                #else
                _usleep(difftime(f_current_time,a_time) * 1000);
                #endif // win32
}
//---------------------------------------------------------------------------

time_t __stdcall stk::time::wait_idle(const time_t a_prev_time, const double a_percent_of_idle) // cross-platform sleep_until function
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
        time_t f_current_time = ::time(NULL);
        wait_ms((uint64_t)(a_percent_of_idle * difftime(a_prev_time,f_current_time)) / 100);
        return f_current_time;

}
//---------------------------------------------------------------------------
#ifdef __WIN32__
time_t __stdcall stk::time::FILETIME_to_time_t(FILETIME const& ft)
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
                ULARGE_INTEGER ull;
                ull.HighPart = ft.dwHighDateTime;
                ull.LowPart = ft.dwLowDateTime;
                return (ull.QuadPart / (LONGLONG)10000000) - (LONGLONG)11644473600;
}

FILETIME* __stdcall stk::time::time_t_to_FILETIME(time_t t, LPFILETIME pft)
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED("")
#endif
// Note that LONGLONG is a 64-bit value
                LONGLONG ull;
                ull = (LONGLONG)(((LONGLONG)t) * (LONGLONG)(10000000 + 116444736000000000));
                pft->dwLowDateTime = (DWORD)ull;
                pft->dwHighDateTime = ull >> 32;
                return pft;
}
//---------------------------------------------------------------------------
#endif


#include <iostream>
#include <iomanip>

bool isLeapYear(const unsigned int& ) { return false; } //checks if 'year' is leap year
unsigned int firstDayOfJanuary( unsigned int& year ) { return 0; }
unsigned int numOfDaysInMonth( unsigned int , unsigned int& ) { return 0; } // takes the number of the month, and 'year' as arguments
void printHeader( unsigned int ) {} //takes the number of the month, and the first day, prints, and updates
void printMonth( unsigned int , unsigned int& ) {} //takes number of days in month, and reference to 'firstDayInCurrentMonth' so it updates after every call
void skip( unsigned int i ) {
        while ( i > 0 ) {
                std::cout << " ";
                i--;
        }
}


int printcalendar() {
        unsigned int year , firstDayInCurrentMonth;
        std::cout << "Calendar year? ";
        std::cin >> year;
        std::cout << "\n";
        firstDayInCurrentMonth = firstDayOfJanuary( year );
        skip(9);
        std::cout << year << "\n";
        for ( unsigned int currentMonth = 1 ; currentMonth <= 12 ; currentMonth++ ) {
                printHeader( currentMonth );
                printMonth( numOfDaysInMonth( currentMonth , year ) , firstDayInCurrentMonth );
                std::cout << "\n\n\n";
        }
        std::cout << "Press Enter to Exit...";
        std::cin.ignore();
        std::cin.get();
        return 0;
}

bool __stdcall is_leap_year( const unsigned int& year )
{
    return (year % 4 == 0) && (year % 100 != 0 || year % 400==0);
}

unsigned int __stdcall days_in_month(const unsigned int& month, const unsigned int& year ) {
    if (month==2) return 28 + is_leap_year(year);
    else return 30 + (month & 1);
}

void printcalendarheader( unsigned int m ) {
        skip( 7 );

        if ( m == 1 ) std::cout << "January";
        else if ( m == 2 ) std::cout << "February";
        else if ( m == 3 ) std::cout << "March";
        else if ( m == 4 ) std::cout << "April";
        else if ( m == 5 ) std::cout << "May";
        else if ( m == 6 ) std::cout << "June";
        else if ( m == 7 ) std::cout << "July";
        else if ( m == 8 ) std::cout << "August";
        else if ( m == 9 ) std::cout << "September";
        else if ( m == 10 ) std::cout << "October";
        else if ( m == 11 ) std::cout << "November";
        else if ( m == 12 ) std::cout << "December";

        std::cout << "\n S  M  T  W  T  F  S" << "\n";
        std::cout << "____________________" << "\n";
}

void printcalendarmonth( unsigned int numDays, unsigned int &weekDay ) {
        skip( 3 * weekDay ); //3 is width of a calendar number
        for ( unsigned int day = 1 ; day <= numDays ; day++ ) {
                std::cout << std::setw(2) << day << " ";

                if ( weekDay == 6 ) {
                        std::cout << "\n";
                        weekDay = 0;
                }
                else
                        weekDay++;
        }
}
