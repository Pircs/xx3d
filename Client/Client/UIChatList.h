//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#pragma once /* UIChatList.h */
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#include "UIListBox.h"
#include "TSingleton.h"
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class CUIChatList: public CUIListBox, public TSingleton<CUIChatList>
{
public:
	CUIChatList();
	~CUIChatList();
	// ----
	void addMessage(const wchar_t* wszMessage);
};
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------