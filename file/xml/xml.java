package com.turboirc.xml;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintStream;
import java.util.ArrayList;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class XML {
	
	String FileName = null;
	InputStream wf = null;
	XMLElement root = new XMLElement(null,"root");
	
	public static String XMLEncode(String s)
		{
		// Encodes the value from v to &v
		String ss = new String();
		int len = s.length();
		for(int i = 0 ; i < len ; i++)
			{
			char b1 = s.charAt(i);
			char b2 = ' ';
			if (i < (len - 1))
				b2 = s.charAt(i + 1);
			
			if (b1 == '&' && b2 != '#')
				{
				ss += "&amp;";
				}
			else
			if (b1 == '>')
				{
				ss += "&gt;";
				}
			else
			if (b1 == '<')
				{
				ss += "&lt;";
				}
			else
			if (b1 == '"')
				{
				ss += "&quot;";
				}
			else
			if (b1 == '\'')
				{
				ss += "&apos;";
				}
			else
				{
				ss += b1;
				}
			}
		
//		String ss = new String(s);
		return ss;
		}

	
	public static String XMLDecode(String s)
		{
		String ss = new String(s);
		return ss;
		}
	
	public XML(String fn)
		{
		FileName= new String(fn);
		try 
			{
			wf = (InputStream)new FileInputStream(FileName);
			Parse();
			} 
		catch (Throwable e) 
			{
			}
		}
	public XML(InputStream wx)
		{
		FileName = new String("");
		wf = wx;
		try 
			{
			Parse();
			} 
		catch (Throwable e) 
			{
			} 
		}
	
	public String Serialize()
		{
		String s = new String("<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n");
		return s.concat(root.Serialize());
		}
	
	
	public XMLElement GetRootElement()
		{
		return root;
		}
	
	public boolean Save(String fn)
		{
		String s = Serialize();
		try 
			{
			FileOutputStream fout = null;
			fout = new FileOutputStream(fn);
			PrintStream wf = new PrintStream(fout);
			
			wf.print(s);
			wf.close();
			}
		catch(Throwable ex)
			{
			return false;
			}
		return true;
		}
	
	
	static public class XMLHeader
		{
		}
	
	static public class XMLElement
		{
		private String name = null;
		private XMLElement Parent = null;
		private ArrayList<XMLVariable> Variables = null;
		private ArrayList<XMLElement> Children = null;
		private ArrayList<XMLComment> Comments = null;
		private ArrayList<XMLContent> Contents = null;
		private ArrayList<XMLCData> CDatas = null;
		
		public XMLElement Duplicate()
			{
			XMLElement nx = new XMLElement(Parent);
			nx.name = new String(name);
			nx.Variables = new ArrayList<XMLVariable>(Variables);
			nx.Children = new ArrayList<XMLElement>(Children);
			nx.Comments = new ArrayList<XMLComment>(Comments);
			nx.Contents = new ArrayList<XMLContent>(Contents);
			nx.CDatas = new ArrayList<XMLCData>(CDatas);
			return nx;
			}
		
		public int GetDeepLevel()
			{
			if (Parent == null)
				return 0;
			return Parent.GetDeepLevel() + 1;
			}
		
		public String GetDeepLevelString()
			{
			String a = new String("");
			int dl = GetDeepLevel();
			for(int i = 0 ; i < dl ; i++)
				{
				a += ("\t");
				}
			return a;
			}
		
		public XMLElement AddElement(XMLElement y)
			{
			if (y == null)
				return null;
			y.Parent = this;
			Children.add(y);
			return y;
			}
		public XMLElement AddElement(XMLElement y,int idx)
			{
			if (y == null)
				return null;
			y.Parent = this;
			Children.add(idx,y);
			return y;
			}
		
		public XMLVariable AddVariable(XMLVariable y)
			{
			if (y == null)
				return null;
			y.Parent = this;
			Variables.add(y);
			return y;
			}
		public XMLVariable AddVariable(XMLVariable y,int idx)
			{
			if (y == null)
				return null;
			y.Parent = this;
			Variables.add(idx,y);
			return y;
			}
		
		public XMLVariable AddVariable(String n,String v)
			{
			if (n == null || v == null)
				return null;
			XMLVariable y = new XMLVariable(null,n,v);
			y.Parent = this;
			Variables.add(y);
			return y;
			}

		public XMLContent AddContent(XMLContent y)
			{
			if (y == null)
				return null;
			y.Parent = this;
			Contents.add(y);
			return y;
			}
		public XMLContent AddContent(XMLContent y,int idx)
			{
			if (y == null)
				return null;
			y.Parent = this;
			Contents.add(idx,y);
			return y;
			}
		
		public XMLContent AddContent(String v)
			{
			if (v == null)
				return null;
			XMLContent y = new XMLContent(null,v,0);
			y.Parent = this;
			Contents.add(y);
			return y;
			}
		
		public XMLCData AddCData(XMLCData y)
			{
			if (y == null)
				return null;
			y.Parent = this;
			CDatas.add(y);
			return y;
			}
		public XMLCData AddCData(XMLCData y,int idx)
			{
			if (y == null)
				return null;
			y.Parent = this;
			CDatas.add(idx,y);
			return y;
			}
		public XMLCData AddCData(String v)
			{
			if (v == null)
				return null;
			XMLCData y = new XMLCData(null,v,0);
			y.Parent = this;
			CDatas.add(y);
			return y;
			}		
		
		public ArrayList<XMLElement> GetChildren()
			{
			return Children;
			}
		public ArrayList<XMLVariable> GetVariables()
			{
			return Variables;
			}
		public ArrayList<XMLComment> GetComments()
			{
			return Comments;
			}
		public ArrayList<XMLContent> GetContents()
			{
			return Contents;
			}
		public ArrayList<XMLCData> GetCDatas()
			{
			return CDatas;
			}

		public String GetName()
			{
			return new String(name);
			}
		public XMLElement Parent()
			{
			return Parent;
			}
		
		public XMLElement(XMLElement P)
			{
			Parent = P;
			name = new String("e");
			Variables = new ArrayList<XMLVariable>(0);
			Children = new ArrayList<XMLElement>(0);
			Comments = new ArrayList<XMLComment>(0);
			Contents = new ArrayList<XMLContent>(0);
			CDatas = new ArrayList<XMLCData>(0);
			}
		public XMLElement(XMLElement P,String n)
			{
			Parent = P;
			name = new String(n);
			Variables = new ArrayList<XMLVariable>(0);
			Children = new ArrayList<XMLElement>(0);
			Comments = new ArrayList<XMLComment>(0);
			Contents = new ArrayList<XMLContent>(0);
			CDatas = new ArrayList<XMLCData>(0);
			}

		
		public void SetName(String s)
			{
			if (s != null)
				name = new String(s);
			}
		
		public XMLElement GetParent()
			{
			return Parent;
			}
		

		public XMLElement FindElementZ(String n,boolean Case,boolean CreateIfNot)
			{
			for(int i = 0 ; i < Children.size() ; i++)
				{
				if (Case)
					{
					if (Children.get(i).GetName().equals(n))
						return Children.get(i);
					}
				else
					{
					if (Children.get(i).GetName().equalsIgnoreCase(n))
						return Children.get(i);
					}
				}
			if (CreateIfNot == false)
				return null;

			XMLElement e = new XMLElement(this);
			e.SetName(n);
			Children.add(e);
			return Children.get(Children.size() - 1);
			}
		
		public XMLVariable FindVariableZ(String n,boolean Case,boolean CreateIfNot)
			{
			for(int i = 0 ; i < Variables.size() ; i++)
				{
				if (Case)
					{
					if (Variables.get(i).GetName().equals(n))
						return Variables.get(i);
					}
				else
					{
					if (Variables.get(i).GetName().equalsIgnoreCase(n))
						return Variables.get(i);
					}
				}
			if (CreateIfNot == false)
				return null;

			XMLVariable e = new XMLVariable(this,n,"");
			Variables.add(e);
			return Variables.get(Variables.size() - 1);
			}		
		
		public String Serialize()
			{
			String s = null;
			
			if (Children.size() == 0 && Comments.size() == 0 && CDatas.size() == 0 && Contents.size() == 0)
				{
				// We will create a <text x y z />
				String AllVars = new String("");
				for(int i = 0 ; i < Variables.size() ; i++)
					{
					XMLVariable v = Variables.get(i);
					String x = v.Serialize();
					AllVars += x;
					AllVars += " ";
					}
				
				if (AllVars.length() > 1)
					s = String.format("%s<%s %s />\r\n",GetDeepLevelString(),name,AllVars);
				else
					s = String.format("%s<%s/>\r\n",GetDeepLevelString(),name);
				}
			else
				{
				// We will create a <text x y z >
				String AllVars = new String("");
				for(int i = 0 ; i < Variables.size() ; i++)
					{
					XMLVariable v = Variables.get(i);
					String x = v.Serialize();
					AllVars += x;
					AllVars += " ";
					}
				
				
				if (AllVars.length() > 1)
					s = String.format("%s<%s %s>\r\n",GetDeepLevelString(),name,AllVars);
				else
					s = String.format("%s<%s>\r\n",GetDeepLevelString(),name,AllVars);
				
				// All Children
				for(int i = 0 ; i < Children.size() ; i++)
					{
					// Check comments,cdatas,text before those
					for(int y = 0 ; y < Comments.size() ; y++)
						{
						XMLComment c = Comments.get(y);
						if (c.GetBE() != i)
							continue;
						
						String u = c.Serialize();
						s += String.format("%s%s\r\n",GetDeepLevelString(),u);
						}
					for(int y = 0 ; y < CDatas.size() ; y++)
						{
						XMLCData c = CDatas.get(y);
						if (c.GetBE() != i)
							continue;
						
						String u = c.Serialize();
						s += String.format("%s%s\r\n",GetDeepLevelString(),u);
						}
					for(int y = 0 ; y < Contents.size() ; y++)
						{
						XMLContent c = Contents.get(y);
						if (c.GetBE() != i)
							continue;
						
						String u = c.Serialize();
						s += String.format("%s%s\r\n",GetDeepLevelString(),u);
						}
					
					XMLElement ch = Children.get(i);
					String u = ch.Serialize();
					s += String.format("%s",u);
					}
				
				// Shoot remaining stuff
				for(int y = 0 ; y < Comments.size() ; y++)
					{
					XMLComment c = Comments.get(y);
					if (c.GetBE() < Children.size())
						continue;
					
					String u = c.Serialize();
					s += String.format("%s%s\r\n",GetDeepLevelString(),u);
					}
				for(int y = 0 ; y < CDatas.size() ; y++)
					{
					XMLCData c = CDatas.get(y);
					if (c.GetBE() < Children.size())
						continue;
						
					String u = c.Serialize();
					s += String.format("%s%s\r\n",GetDeepLevelString(),u);
					}
				for(int y = 0 ; y < Contents.size() ; y++)
					{
					XMLContent c = Contents.get(y);
					if (c.GetBE() < Children.size())
						continue;
					
					String u = c.Serialize();
					s += String.format("%s%s\r\n",GetDeepLevelString(),u);
					}
				
				// End
				s += String.format("%s</%s>\r\n",GetDeepLevelString(),name);
				}
			return s;
			}
		}
	
	
	static public class XMLContent
		{
		private String value = null;
		private XMLElement Parent = null;
		private int BeforeElement = 0;
		
		public int GetBE()
			{
			return BeforeElement;
			}
		public XMLContent(XMLElement p,String v,int be)
			{
			BeforeElement = be;
			Parent = p;
			value = v;
			}
		
		public String GetValue() 
			{
			return new String(value);
			}
		XMLElement GetParent()
			{
			return Parent;
			}
		String Serialize()
			{
			String s = String.format("%s",XML.XMLEncode(value));
			return s;
			}
		
		}
	static public class XMLComment
		{
		private String value = null;
		private XMLElement Parent = null;
		private int BeforeElement = 0;

		public int GetBE()
			{
			return BeforeElement;
			}
		public XMLComment(XMLElement p,String v,int be)
			{
			BeforeElement = be;
			Parent = p;
			value = v;
			}
		public String GetValue() 
			{
			return new String(value);
			}
		XMLElement GetParent()
			{
			return Parent;
			}
		String Serialize()
			{
			String s = String.format("<!-- %s -->",value);
			return s;
			}
		
		}
	static public class XMLCData
		{
		private String value = null;
		private XMLElement Parent = null;
		private int BeforeElement = 0;
		public int GetBE()
			{
			return BeforeElement;
			}
		public XMLCData(XMLElement p,String v,int be)
			{
			BeforeElement = be;
			Parent = p;
			value = v;
			}
		public String GetValue() 
			{
			return new String(value);
			}
		XMLElement GetParent()
			{
			return Parent;
			}
		String Serialize()
			{
			String s = String.format("<![CDATA[%s]]>",value);
			return s;
			}
		
		}
	
	static public class XMLVariable
		{
		private String name;
		private String value;
		private XMLElement Parent = null;
		
		public XMLVariable(XMLElement p)
			{
			Parent = p;
			name = new String("");
			value = new String("");
			}
		public XMLVariable(XMLElement p,String n,String v)
			{
			Parent = p;
			name = new String(n);
			value = new String(v);
			}
		String Serialize()
			{
			String s = String.format("%s=\"%s\"",name,XML.XMLEncode(value));
			return s;
			}
		
		public String GetName() 
			{
			return new String(name);
			}
		public String GetValue() 
			{
			return new String(value);
			}
		public void SetName(String s) 
			{
			name = new String(s);
			}
		public void SetValue(String s) 
			{
			value = new String(s);
			}
		XMLElement GetParent()
			{
			return Parent;
			}
		}
	
	
	private void Parse()
		{
		try 
			{
			XmlPullParserFactory pf = XmlPullParserFactory.newInstance();
			XmlPullParser pp = pf.newPullParser();
			pp.setInput(wf, null);
//			pp.setFeature(XmlPullParser.FEATURE_PROCESS_NAMESPACES, false);
//			pp.setFeature(XmlPullParser.FEATURE_REPORT_NAMESPACE_ATTRIBUTES, false);
			
			int event = pp.next();
			
			XMLElement CurrentParent = null;
			
			for (; ; event = pp.next()) 
				{
				if (event == XmlPullParser.END_DOCUMENT)
					break; // End !

				if (event == XmlPullParser.END_TAG)
					{
					if (CurrentParent != root && CurrentParent != null) // Root
						{
						XMLElement e = CurrentParent.GetParent();
						CurrentParent = e;
						}
					}
				
				if (event == XmlPullParser.START_TAG)
					{
					if (CurrentParent == null) // Root
						{
						CurrentParent = root;
						}
					else
						{
						XMLElement e = new XMLElement(CurrentParent);
						CurrentParent.Children.add(e);
						CurrentParent = e;
						}
					
					String ElName = pp.getName();
					CurrentParent.SetName(ElName);
					
					// Variables
					int vc = pp.getAttributeCount();
					CurrentParent.Variables.clear();
					for(int i = 0 ; i < vc ; i++)
						{
						String n = pp.getAttributeName(i);
						String v = pp.getAttributeValue(i);
						XMLVariable xu = new XMLVariable(CurrentParent,n,v);
						CurrentParent.Variables.add(xu);
						}
					}
				
				if (event == XmlPullParser.COMMENT)
					{
					String t = pp.getText().trim();
					if (t != null && t.length() != 0)
						{
						XMLComment c = new XMLComment(CurrentParent,t,CurrentParent.GetChildren().size());
						CurrentParent.Comments.add(c);
						}
					}
				
				if (event == XmlPullParser.CDSECT)
					{
					String t = pp.getText().trim();
					if (t != null && t.length() != 0)
						{
						XMLCData c = new XMLCData(CurrentParent,t,CurrentParent.GetChildren().size());
						CurrentParent.CDatas.add(c);
						}
					}
				
				if (event == XmlPullParser.TEXT)
					{
					String t = pp.getText().trim();
					if (t != null && t.length() != 0)
						{
						XMLContent c = new XMLContent(CurrentParent,pp.getText(),CurrentParent.GetChildren().size());
						CurrentParent.Contents.add(c);
						}
					}
				
				}
			}
		catch(Throwable ex)
			{
			}
		}
	
	

}
