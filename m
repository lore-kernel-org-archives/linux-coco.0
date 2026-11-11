Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794356173;
	b=00XHN1uWyLOZZOpsNR2S0C9853xL3tsyd7hKWiWwV4z8sf+idPakEF1182nsEJ5dPB6s
	 VGEFG5SAVPJ1SqYDQmeXvR1Wy445HuGkVjn7VcHl1W9JZQcO3qOfHOgGXr/OtiSibTgae
	 CQMlCSraJSQsEEbbrdybCJp1YQJ8w+P3H40drGolOSNC9hKIa6Z+iezWPzDRKofTwhsmu
	 xwgnUYUmTEy0V+v+n9Ehz3Nmzqpmyh0359m5H7JtdqtFtJU6FGeQDKD8N9LyrSSVSdJkx
	 ybMlT76xIq8ciUeMk8/Jz8ivA2EVOQFT/PL+KDiANMkucp+cqxt7H6R6tJ6amCtZjmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356173;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=38iNAX1vvBS0xZCMkDFNeMyIDJExgOWTCdYChpV3yfg=;
	b=HyWVXS2uq3T84AMigG8UgRJtCf4XslNKPwQEsRUmhJW1rEOpLAf0/+2LX7CQB1hDhWIi
	 9NT2chTP/v6s2cf+8cmhTA7dDJC039fnSNYWpzvJQDF/a0gdLyejAH+kwci2wdJym2cRg
	 WbqPEFh/5Re5nY5JoprK+eQSj+2vBvInAcbm+nyGHKrflMzAtYN2OzAHLzP6YDw2bNdwm
	 6QDMRglcCMaEr+czYxrIRaqXXcS1o/ZxiKQLa2gTXUfbkB/DkDchXNmCTlM0sXUHsisCL
	 QAR3lu1ALxG+anMSZkS9fvgDn4ID+EP6PF2VSFCSAdnPUGMsrfvEUZxx0FvJaAT/V1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XoDU3CkW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.57
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A3606A325
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 00:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XoDU3CkW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjsnxoTb+93eRA/VM6vbwVYoSZ55wLSufhkTc1PlJKlpOP81RNBNoIUsVMi8/Vhj7+Dvj6KYAngvNplMn5oKg3IqYsshULYVzEr/a2K6Bk8JzabvGoRs3em1Fz0+Li+yrXuQMIyHNkV9+KyAmkgZvQuetTaljYxW2pV02Sggz4v7ZhRYQalzs+tMY9EZFYByq9jU/oUgIRk4Y7wcUMq4XZ9uU0jp5ZvRmiv1n0w2vqJgweieJMRY0YqYBLYQCOv5Wy28apXj/ePHH/0hFyIoCov16WSt1KjduEiTIVosIshL/xI34nlbdcO0W5MR7cZ7fF4cdAJBAYxq3Dexs8s1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38iNAX1vvBS0xZCMkDFNeMyIDJExgOWTCdYChpV3yfg=;
 b=O87Y0PtgWMbnxk2Al5+6PScPvCCULR0baWFWu1WMzpaKHuj1fLHv4o3DHR44x9xY4AZCJ8iq92N3ohVSirD7FOcLWKcssFyynTl4FpgtTwUVS6/Lmp0lTEpc/ETpsbGd+yuNXgT9SyV//qkp8BuxGM63WZ1SHlAbPjFPuFeo2y0ae64poAUCshvo4TB4X+RDSmUHtnnBC14fUEyrSN7/XkBykPIz2dlHzK/0QdxpBbdMMgbpBXRFuB1j0Asiws7paZCh1MPfU/vOhVd6LBOgWG7qU2tZV6BQcnAp/QDj1GtdQyg05nW+goAvOIlLi6+I3A3HEXXBbO91WqBJbKhB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38iNAX1vvBS0xZCMkDFNeMyIDJExgOWTCdYChpV3yfg=;
 b=XoDU3CkWQuZzzGj1jypc/9y1BZ2Pj7ENM82qyrZuZoBbCzFaRusSG1Vod7WD2pIr/YJvOWVvV3IlWIxr2sFf3CxAUdx32evMv3/mDaOvpI7xXJekNKYlxq2l/pQ89iwbQS6+IRhWGkeQkWYQLsAAUAkJL1AqY3+3PWI3gWM3gwyIyeUNbx8CvXlwc5rdFG9H2EKxUaKUx7J0MGXhqLe/I7sJDC1FOYHEf9lKxDtwH8bQhaXmYJ8T0iDz9rl0sFLqAtzsvo1R9Qvq0VWhiBHN5jaF4i0Q5xV8kx4r16VLTL44WLieaginycpjj8x0W+KxuG9Vh0CTCBdP+3LCjXiy8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CH4PR12MB027447.namprd12.prod.outlook.com
 (2603:10b6:610:508::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 00:16:07 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 00:16:07 +0000
Date: Tue, 10 Nov 2026 20:16:06 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <20261111001606.GH738765@nvidia.com>
References: <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
X-ClientProxiedBy: BN9PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:408:fb::32) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CH4PR12MB027447:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a942b4-df29-4094-d72f-08df3f88fb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|261028144727099003|261026140227099003|56012099006|261021135927099003|261022105027099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	KngPGXI/48LF7F0L6Kc1OZ85/Ll1B1e/7yWWn2JkBQEyIHmtFCF9jc4hgT7p7pp4pCBPf7eXkwHxXm/3sLj7nqEKyWSDMREmJrkli36LW1tmK1db6nThezVC7HOAsBUgVeo8Wgl+RazWfnBb6f+i5BkTwaWnI0kT2r0dM8epNT3QWqiMV4qpZBMmppIMswqHLl8N6k3dAq2xCLYRGxriher8Q1MMY21nOWeY1ryX/V0zdDoxR5rovR5qHLfcSDU+hzYmxjZm6FwobQ7lNWUBpDHKNcHAATLZ/8Uu+sBLLHCL2cRCwhZSThZwocBrIp6neojXshhs0KizCZAZ9upgDBx71WQMpt5DY4ASg+OcPXN+2l35UUBbbcxaLbCFhwPh5IAjn/ygOdKj31HjuXfIatmsZPc30u79my00WBJ4LI0f4qABJNNFC2yjMZYOxRI0sM+VZOkTOYTmu1pjLlrfZUa/Ne58X8JKfMmfJLT+YfQ8AkH9+ighpitsy+11p2K2SdDUfNdxBYkof+vxsKXY+/LZWcLK+wLsvsrYPn5YaHpDLMb8jQqHpW1yXkaHrordZp7dCtXJ9/YmP3XbJQ1QvdtwwOwjZ/ROy+FJ1RKH+KAEE0OJYPBHxd+hjM+EsortyHhe8gsawNvGnMIra72NBIGUqXvxlLmQmB4OXN5ieQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261028144727099003)(261026140227099003)(56012099006)(261021135927099003)(261022105027099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkd2ODFVUFVoaWQ5N3Q2aWs4QkFVL1p4MXhIN1l1Nmh1UUVDQjdkaThQUXp0?=
 =?utf-8?B?R29ZZklpY1Q5SXVRZHhKc2JMZG9TVHlXemtaREwvZU1hK1h1TXEzc2lEeC9R?=
 =?utf-8?B?TzZNQkFUd0JHYTZBR3p0TXR5RC9LQWdCZ2Q3M29zTnppNDM5Q0V4WWtNaFJI?=
 =?utf-8?B?UVY5cU9wamxGakZyZkx4V3Mydk9QcjR1dlJJMnZ3bzc1TUJPZzM2Q3gyWkh3?=
 =?utf-8?B?OUdlSFYwcEZYR09uL085ZnZyWCtDSXlud3NVZzRGZmpWaEczajdoSkUyTDFU?=
 =?utf-8?B?eUQwWndnc0ZPcFovWkYyMHdwM0RUNzR2ZUxRb2NWNFRrdVFzeldGclp1ZEZu?=
 =?utf-8?B?WVdaM1BkWkgwdnlVMHpwR01RSkFOY1pvWEtTbm9NaGZlTE1KeVo3OEVUS1Uw?=
 =?utf-8?B?WDhta0lRM3A2Sm5SMFE1ZUhaUjRJUFZYUFNtV1N2aDJRTTNidmxvaWlpUXhs?=
 =?utf-8?B?VEVQOGcvWjB3L3hFeVA1dlJnYjZYNmJleVY5V3EyUC9vTTdDcERiaHAzVito?=
 =?utf-8?B?ekZjQmJJSVJrM29mSVc4UG03c2R5ZEVCZm9WT0NNSnRmQ09VNWJQOG9zRHV6?=
 =?utf-8?B?MVUzSFgvS1ZUNDhmY2JPTkhLdVpGNTcyVkx6cG9JWUZxdTZXN3RYeHRrcTV1?=
 =?utf-8?B?V2tuR2VLajAvZjY1R0JYM2ZnYnd3bVpRVloybjk5UmJmY012U2Z1MVV5OWly?=
 =?utf-8?B?bEpMZWtuRXNWZTkvQTA4em9Ra2RMZHFUajZEd1pxRWRvdHVWVGFBZTNaV1ph?=
 =?utf-8?B?cmd1cXBKdS9TOWxZOElvZGJxSit2TjkrbEEwT2doVlJ2KytqN05URFdXYkM3?=
 =?utf-8?B?Rk81RE1hdFZ6clhtbmplK0R1dkRNMWlKQVd1MWV3SFVENkRSRmI2emZobFRs?=
 =?utf-8?B?QjhJbER4czh4ZE84UlpnUEo0bUR4bUNWVGRVYXJtZnNPRXdQeGpMbTBJTUlN?=
 =?utf-8?B?ektBQlk2UTRic0lQeHUrUW9EWjVYMFJSbE16Smx5b1pMSkJHSVd1aHNqNS9M?=
 =?utf-8?B?dXRrWk94RzFxOEVnRE1tcHlWNmRJQ3VmTVVMMDFxVWJueHk1TGhFbUhTVWtH?=
 =?utf-8?B?UzhNRG0xTWt2OE01d0d1Y3JWRysySk94QW9tbzdmT3d5dnA1N0RjT1dZdVV3?=
 =?utf-8?B?NnNkbzlHOEg5Mm04c2gyRHdFWXZIRzE1Mkt5Q3BsME81VmRZcUg3TFBYamZv?=
 =?utf-8?B?OUgxbTZmRnJuSGpMRzN6K2pOSXJBWEtUUmdpdTdpUnhWeTN2azFiTjhMSFJN?=
 =?utf-8?B?cERYY3UwV2N3QWNWTFhwWnpBYThIRlpIb2dJdTZ2MDNML0RFcitqUldlY1VN?=
 =?utf-8?B?U2xYK2VQTHhsU1hvcEZwMWtvV1dWUzgzdjd3SDlYTkVid1M3Nko4QkdPZDNw?=
 =?utf-8?B?UjNnMTJJUWFwVkx3cThFM29lTVpleFI5Zk9ueTdLdVVlbXNRK0FmUlhZMGlS?=
 =?utf-8?B?TUZ1OUE1MFA0QkY4YitWN3l1TUV1VWF5U3QyVGZiSUlXb0RIWmZ1N3hxbU1H?=
 =?utf-8?B?dkdZSk1ZTU5oQnFERFo1NXh4bTdtQ1UyWTJMdloxVlpocHFlbDFiUVBTMUwv?=
 =?utf-8?B?aXUrRGNIVzlManRuYnlxR2xveTRzUGx1Znl5dVc2VWVyTVlYY0gyMTJLNGVx?=
 =?utf-8?B?OFVuRDNZZXh4dk9GQWdRaEpBY1JSaDRpamh5YitvbThwdVhYamZ2djdpR2l1?=
 =?utf-8?B?M3pJY0lXa2pwYUxJU0xxcE15K0FEdXQ1eDI2NVNIYnVOYWw0dWlNbTYyNUJT?=
 =?utf-8?B?b0hHNFdKaElacW85enh5UDd6ZzBPNTJBSmc3R3R1QVhha1cxOE1GOVVMcFk1?=
 =?utf-8?B?NkQxWVZRZDdzWXg3NjdRVHBNQ3N4bmZoQ0loNDQyY1BjcElqb2RkT2NhL3Vm?=
 =?utf-8?B?Nk13ZFdWYVR5TjhWQWFWT202ZEMyNXRuSm4zTGNqeFFCeU9jY2NZbHRhR2pG?=
 =?utf-8?B?WDRkSXVmY1VYT2NQMnBNNFQwR2xPL0hNOXF5TlBsdWs5bjR4T1pUMlNKaE85?=
 =?utf-8?B?MStyeGdGNWIxVEh1dk16YjR4R2srZ2JFK01xYVlTS2ZDQlNjYjRnVFp1Z1RN?=
 =?utf-8?B?R3NMeTZHMVA5NEtZUmdGT3hjaXptMmoyMEdpcExYckppYzNIdE1FNXJJVklu?=
 =?utf-8?B?QmdNb3ZTcisxcXJ2d045OWYrNmprODd0d1BoaThxckhrNEF0ajdZMGpRMDFB?=
 =?utf-8?B?NGNtVHR3ZXp2VDZrTlR0NXplTHg0Y2l1ZTBiaFk5cmo3eUhIbG5kOFlQRVpT?=
 =?utf-8?B?YU8xMG9VZVJoUFVibG5kTExKRG5ZalZRYWlIM3A4UDc3RVkva2RlWmdJckZv?=
 =?utf-8?Q?Nl7+27XiK8jx00g10j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a942b4-df29-4094-d72f-08df3f88fb34
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 00:16:07.3634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs4ll84B1CcHnuL/qh+isNUn/Lc4JNgXDl1gEXcY+kgMXhlpXXMUV3WOBsJvTGyH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB027447

On Tue, Nov 10, 2026 at 10:25:07PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2026-11-10 at 15:57 -0400, Jason Gunthorpe wrote:
> > On Tue, Nov 10, 2026 at 06:55:41PM +0000, Edgecombe, Rick P wrote:
> > 
> > > Additionally, we should probably see if Jason has any opinion on the types of
> > > errors that guest TSM would like to handle.
> > 
> > Not at this point :\ And perhaps not at all.
> > 
> > Most of this stuff will end up routing through userspace so it has to
> > be compressed into a errno.'
> > 
> > The various VMM to guest specs like GHCI are going to define their own
> > contracts, and it is up to Intel to ensure that the full route from
> >   this code -> attestation subsystem -> uapi -> vmm -> GHCI
> > 
> > Preserves whatever semantics have been defined in the spec.
> > 
> > I don't know the answer to the EBUSY question, other than
> > TSM/attestation will return that to userspace. Can your VMM and GHCI
> > sort it out?
> 
> Kevin and Yilun are analyzing what kind of errors we should expect the VMM to
> handle. But some of the cases Zhenzhong listed seem like they could be
> situations trusted IO guests could encounter generally. Like the example
> "[device] firmware hangs during lock/unlock". In that case unification in TSM
> could be nice.
> 
> For errors that indicate uncooperative or buggy host, we elsewhere warn in the
> TDX wrappers. But in coco, not handling an error in the caller can be an avenue
> to attack the guest. So I guess we would commonly need to handle these errors in
> the callers.

Any failure to attest should just propogate to guest userspace and
userspace wil fail the attestation and not enable the device. This is
fine.

All failure classes, including the cases where the guest is checking
digests/etc to confirm the host has done the right thing can work like
this.

> Zhenzhong had previously suggested a bool to set a device as bugged for the
> purpose of trying to continue guest execution as well as possible in the face of
> host issues.

It does not seem necessary to me, userspace is responsible. Since no
device evidence could possibly have been logged the VM would fail
attestation anyhow.

Jason
