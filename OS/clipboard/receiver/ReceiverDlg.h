// ReceiverDlg.h : header file
//

#if !defined(AFX_RECEIVERDLG_H__6241AA22_E824_484E_AB47_9396AD1EFADF__INCLUDED_)
#define AFX_RECEIVERDLG_H__6241AA22_E824_484E_AB47_9396AD1EFADF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CReceiverDlg dialog

class CReceiverDlg : public CDialog
{
// Construction
public:
	CReceiverDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CReceiverDlg)
	enum { IDD = IDD_RECEIVER_DIALOG };
	CString	m_szStr;

	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CReceiverDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CReceiverDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	/*afx_msg void OnBtnString();*/
	afx_msg BOOL OnCopyData(CWnd* pWnd, COPYDATASTRUCT* pCopyDataStruct);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RECEIVERDLG_H__6241AA22_E824_484E_AB47_9396AD1EFADF__INCLUDED_)
