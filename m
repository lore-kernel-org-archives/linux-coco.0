Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF42153828
	for <linux-coco@lists.linux.dev>; Tue, 11 Jun 2024 20:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718138775; cv=fail; b=bJoR43LulPtcM0BUu49FuNNEGrLpeVlHUBnt3GGzFln/7OPa0sfQ133csT5qq+jb9oKznfK0JCnL3HPdZxYPZFR1ApzbU55OBLYjWAxTuu90v+GusMVAoqooXlNYYFm1dG18oaeYt4ngGE1d5V/uY7/7TcyeUkzi9cccgWcTABk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718138775; c=relaxed/simple;
	bh=BURwFuX++bYVZ1QMbdmyYURDo9KsIxyEBmApWJdHMgU=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oL9WOCV7jeMCkoXZWhjmTQsBdERmV7Ef3Eet52rw5DEG96ssTzmnANungBjzWq19JAyNGSA8JFm8p8tGQEBvbeY1tTr7P0Ku6vg20Izz67L6K/YOi+ukj+z7QZsvrzIy4cCjXNIJeaa+OV0aqfjqAN150jYxTqYLxZi9/j66EQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ibm.com; spf=pass smtp.mailfrom=ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pvJdj2av; arc=fail smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pvJdj2av"
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BJtqLD016689;
	Tue, 11 Jun 2024 20:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-type:content-id
	:content-transfer-encoding:mime-version; s=pp1; bh=BURwFuX++bYVZ
	1QMbdmyYURDo9KsIxyEBmApWJdHMgU=; b=pvJdj2av8wznfqSVKJoT1gurtpXEm
	KCOSBIYO5mSE2KgO2zB8FdYHK/i2uJS2wIDIz6hsWiDkVhrBo9J9udlYlYY0mPW8
	thFpFLve/1X0B0Xy8wQYREzCEub9ozli8Wkw5o3tcQ2gr8TAY54/0dHupawrP/IJ
	VjpDZcSZSO5cBu6CQeDfxnsguAijNpKph7+O7fu0X9YmbrIZ6h+Xro+5F4lcX9+e
	iMHXBhSKBFw3uJ06IHhvNn+7/YyZHSApFPfvTa/DoVlQCtoVatXn6U69tWDAJzR2
	UBfAdYdNKGFDzqg4Co2QpFbZvAwfJx1S5jqnubHCbK6lVQTcK3y2a+Wig==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yptj1gkgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 20:46:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXTsPSezkXLtIIKnp47qKxqQmhjIWwo6Qj8nftxrgrbT7+yxy8Pck0YmpBBxzU1uE+CAzhU6LhPTN+bYmxeYfONCi6zj6p9N83YK/rseYg3LCFHGTlhBXg5B19W16QrQZfDTCtV6OrjOvJLF8K/G1mSyOYmnzIfJSjX1HRCW93qmvYjwirKotzMeVWlKZGQfhLpE5H9TcFEChr2DShNS6RTnErcpQP9D6ityLxrz49Ya4s3Asw9WZqLncaqYFQVfT+3bvn1Y1m+kR+vc8ITXE7rV4xLVoZQ0VFyCjB9UkMwDfFnywrvQup4VXsOJKXv7f9p2fyY3hdBkauG41x1r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BURwFuX++bYVZ1QMbdmyYURDo9KsIxyEBmApWJdHMgU=;
 b=DLDanelNyRXFIkjdMt/uOpRYhlKHyBXB4Ic0VWcuFoiPCYGmk3KidILW7obTrMwK/DuZL53DBG3P92DIVyGcX+RCRdlWcI2Gd/HNG4U6YQVU5vvNQKx+q/isdkPfIWx78c73UIO8ZZ037bGN3Tlo4f4Sho0Kz9htFxhMQ1Zq7DQapeyN+TIgQaUUrt/q2NiX5TxkXhzLCaH2y6e2NP1eQmVfqfyi789pcJgtWSGDTFPtPmMb2pIH9SM7PDx0GqZJ8cEvAo+X8cs1gp/6x0ILB2Q6GkH8VD3wD3wuomg7r4cGw8vlTYq0HmIfzgAKxTR3pIixD47VF+zVkgB7x1Co2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from CH2PR15MB3702.namprd15.prod.outlook.com (2603:10b6:610:e::12)
 by DS0PR15MB6037.namprd15.prod.outlook.com (2603:10b6:8:15f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 20:46:04 +0000
Received: from CH2PR15MB3702.namprd15.prod.outlook.com
 ([fe80::7d85:4f71:8b42:b5bb]) by CH2PR15MB3702.namprd15.prod.outlook.com
 ([fe80::7d85:4f71:8b42:b5bb%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 20:46:02 +0000
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
CC: "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "joro@8bytes.org" <joro@8bytes.org>
Subject: SVSM Development Call - June 12th, 2024
Thread-Topic: SVSM Development Call - June 12th, 2024
Thread-Index: AQHavEBf3aCaoznUJk+xGLBfo0dC3w==
Date: Tue, 11 Jun 2024 20:46:02 +0000
Message-ID: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR15MB3702:EE_|DS0PR15MB6037:EE_
x-ms-office365-filtering-correlation-id: a8c693e6-54ee-4f4f-27a2-08dc8a5781fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?aEgzdTBJMzIyYmx5eTZ1VCtFM05xUG1Pcm5DTFU2OVFtaWxhMkh6QUR4WTJL?=
 =?utf-8?B?aEpsSkcwQjBSeHVjQlFBU2drL0kxclVjcEUwZnQrbzV3YXNaUTNBdnB4YlQ2?=
 =?utf-8?B?RWtIZjBVNGo3YUMrNmxrT2NwQm81LzJPNG9PS2lBYlBZRmp3V2Q3RG5wbU5Y?=
 =?utf-8?B?SFlJYlFPQndEYmQxUFFxcXlGMldNdjFPRXBlUUQvRW1saGJvZXJlMmNtYk9I?=
 =?utf-8?B?K2JYb3BoaHViZzRJSllaVSt2ZlFESmRaVjNKOFJFaXlYdlE4U2F3UTczR0Qw?=
 =?utf-8?B?d0xoaEY0UG95S2ordTI0MXlvTEdCa3BkTURQcHhoMk5yYnBMTWNRZElMbkZo?=
 =?utf-8?B?Ry9XQ0lYMHFBSk93UFBDNlV2WEQzV2JyNTdwWjhlcWxTY1ViQXZOdTBvOGdq?=
 =?utf-8?B?UXdOY0xHYWdyVFVCWjUrdWdiZllPbm9VWVEyZi9rYkxJdFNVc0NZS3dGV3o3?=
 =?utf-8?B?SGpCRDRGV1F0ZUNQbFg3Z2VRcWV5OG0wUGNtcUJtVEpBdXJ5dWlSZVIza29P?=
 =?utf-8?B?cWtLUXl6QmVFeGhrbjlpRWlRMUNBRXpHUVhtWFROejBWbWtGcHZpSlk5R3Ja?=
 =?utf-8?B?K1Y2MlNCS3VWRXBlL0pzZmpHUHQvaWhIbERZcERiZEpvTkwvSXVYeXVreS9m?=
 =?utf-8?B?V2pOMTBGOU1nRWR0cEE1cEwvS004YjFNcVVib0l4QUZVWHRWUWhqQ0E2cm1o?=
 =?utf-8?B?Znpxa09lcjBFckhsVEEwNmJCdThuK3dQRmsxVXg1a2lSc2h4WXhDTUFtQmFX?=
 =?utf-8?B?M0psSXJFVjh3Mk9sVTZJdWgwelE2U3hVSitkZ1pWY1BGR2FFUU0zQ25wY21z?=
 =?utf-8?B?OHcrdXFTRGI1VzJ4ZndFaFFPL0xVcnJPUnVLemxzc2l4SGR3bm5MZ0g5N3Jo?=
 =?utf-8?B?dmZlZ0ROMHloL1hxaE9ocE0zRGZsanUvWDBlSTVFT0szVVlmdTdVSisxWFJF?=
 =?utf-8?B?c0w5QzRYeklOR1lJREJNVzNhSDhqaWN6SE9CTlRTT0Nkb3VwTU1jS2txZW12?=
 =?utf-8?B?NGRpanpuYlptS2VNd0JITFM1UU1HMnAyaWVNeVJSTVRFOVN3aFIxVnpxZkIv?=
 =?utf-8?B?TlEvOW4rdXgySHdMQ1V1Rm9LTWFjZjV1N1hnSmUwTDJUYnlKNTJibkJjNHMx?=
 =?utf-8?B?bEtXMHRDZjJzNUdEdTliK3FrcjdTcXNGUk1oTmVPNlNleFlLRUpZYzZvYmdv?=
 =?utf-8?B?UzMzVWl4dEMwUFNxdFppZWhBSFJVRXA4OG1lL3FKTlRyaGU4ZENXVGpFcEhM?=
 =?utf-8?B?R001Nnl6VnhzWWlNeDNwajBOUGNmZSt3N1gzNmR6RENMdmlHY3Y3aVpkZllY?=
 =?utf-8?B?TGwxWHRkM2pLYXArQXJ6SzVVZFdDZ2RTV05CR29USU9sYUdQd1VIb0l4NHNx?=
 =?utf-8?B?MjlyUENnU1dWeXdJOEYrSmlTRFhPdHRaSEYrM2tJeGVBNVhESjFtUHVTUDhn?=
 =?utf-8?B?MUM2SXF5U0ZRQ3IzcEpnajE3MFdIS1dsZGFXakgrVFlFenhpUzhuK0pEaUhh?=
 =?utf-8?B?WlNUczBDYXVPWHIzSUpCakErdnVpMnlQdDEwVlNnMFc1T0JXVlR2V2doQVBR?=
 =?utf-8?B?SGJLemtSNWF3WHN6aXlEOS9xSm9QSDc4Zmlwem5NMm53eHlJSVVhMHVwcGUw?=
 =?utf-8?B?YUR6bEpiYVY2bUovZWxCVXpZc2dLTlpRMFEzL1ExSzh1SEJLUmFPcjc4WFQv?=
 =?utf-8?B?cGhRa0w5bmRBTVNURnVtbEtGbzEzWGNraTc1cytia1NxWkErLzZ0SDQzWmVw?=
 =?utf-8?Q?Qc1K90mZhPlOFw+C4oYcmFtrze0dgsyn7rsgkrJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR15MB3702.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MCt2di95R0hFR3ViWU9zeE5ncEhNOHJFcSthOTdaMUk5eHdpVS9VTXRua1Yv?=
 =?utf-8?B?NlN2RU5vMEFxUWpRcVR3TkF1VXozZTdBNkhZNER3WUFJUVdXelh0QVhDZzJv?=
 =?utf-8?B?dGhpSWV3QTV3djJBVFhxem5YclR2R1FWK2xTSWJ2YmJEd3R2V2pERGNsZTFR?=
 =?utf-8?B?Tk5jNThkcDNPbVdldlpINEhqeDJodDk2aDd2aDFXeTE2RVM5TWtYQnlPNngy?=
 =?utf-8?B?VjVxWXVqOGxhT0wvUGhVdDVrcEJJKzU5b2NidnAyV056ODRORFpOdzlER01n?=
 =?utf-8?B?UERoRmx0NldmTXNaMFJnMXIycHl5aHltRGpNTll0N05xUExqd1gydHMvNDd5?=
 =?utf-8?B?NWFoUmEwaVJ5cHRtR0ZkM0xCV1prbTVXYUZmS2FoNklVY2dkTlpkVGQrdTd5?=
 =?utf-8?B?c21LQUY0UUI4a0FkTFZUeDZad1dUNDMvbTNGdGFraDJhUndyUU1kNlNydHc2?=
 =?utf-8?B?Rk5uMmdOR0tYTjd4c2RvRE5zcEJYN2UxaWdJMWh6ZHhMK0lnREZxRGdJczRN?=
 =?utf-8?B?KzgzVkxhQ3ZxVEJqdEZFcFB5YzBEYVpFK3dLenUwYVBRZG1VUlFUOGp4T3Np?=
 =?utf-8?B?ZEt1MDgzN3NXUnVPTUNyM3pUVWQ2U096ZTJCUVQxNG50QjJMcElqS3lxK2hD?=
 =?utf-8?B?TTdXTmg1U1UvS01oaldqTmxwUFp2dGNYS3hoeXN1aXdHM0lWaEMweXBtMUNX?=
 =?utf-8?B?TzNuVDJMbldOUXJqUEdtNG5zUVhXdDFRb0JCVVU0QTZldWFReWVHOTN4emxn?=
 =?utf-8?B?RU83a2pUL1phN3h2ekRnZ0ZwS3g0djZjM3ZzMlkzVStQc3V4UGxyUDB4dmJZ?=
 =?utf-8?B?TXJ2c2pXNDFBTlVqd2ExQVhTcy81RTZndThrb1dKelZWU0hXMXdRd0hZZFIy?=
 =?utf-8?B?UHlFMXlZMGxBT1VnUzUzT3BFR05jNGRmblo5YzR0azJNa0hQcnlaV3pJaEI3?=
 =?utf-8?B?VWJQR0dMWFNuVlZpNWhTNU52bXV1d25NaysvVm1hQ2dRZzhVL2xaODhGcnZ1?=
 =?utf-8?B?RHdPRGRLMmMrcW1LRkd3UnFDRE5pdldiWTZlTytTakxqdmt4bWdabkF4Zjlu?=
 =?utf-8?B?SUJtNjNibm5yd3d6NzF3WXZIK3RhNnc1eHJVcjZubXJLWXpoWUNKY1o5U3JV?=
 =?utf-8?B?eEdlcjVlUjI2Q0premNzZHZHZXZuOWI0OTVMejBpUng2MnJ0c0NESzc0amxI?=
 =?utf-8?B?ZVQyMlVpeGp6SllVSkNWN1l3NzdEa09PbFNSSXY0VDFhWE8vNGM0UGN3UzBY?=
 =?utf-8?B?VWJGZ1ZoTDhhdlJ1c2YyaW5TNmpoSm5ISXNmOEY2TzAzK0NoSmM2L0s2Rk9N?=
 =?utf-8?B?Mm1nc2g1OFF1M2pwcXpZUm1mLyt5R1R6UzE4MWxYalpldTJCSXM3aU1tTytp?=
 =?utf-8?B?OHdyQUhGS3MxTEczOTRyb3JrSXdwZlZxYUdaWjkvblhrWXk3ZkRCUmd2aFFI?=
 =?utf-8?B?UmNWelhKd044OVFFUm5GaGVuck9JMWtrUDhyNi9LdGJWN3lQa0VBQmdWNW5a?=
 =?utf-8?B?SUlHbEZmMkJzSkNBNWlXTUZrcnViSFVXZVdZWXVFVTJVQlhOdWtTdnFSSFVF?=
 =?utf-8?B?R041Z3dWaGFsTWl5dnZtZDFrblBjSytGZjM2OFEyOVRyQmRZcW1kcHNEN2pY?=
 =?utf-8?B?OTRhVGdpMXp1Q3VlS1ZMVnZialpZWGFnTG0yQlgvWU9NalE3eW9ZdGJ5YTFn?=
 =?utf-8?B?SVFKOWFHRDNKblJPM2JqTWFKV2Jnc3VyTEY4Zlp4blFZSUNDVWU4d0VmRjVC?=
 =?utf-8?B?enNSdG5ERmFWSVFNdEVoallZYWFZVkt6RkpkK1JuM1ptV0pSdktJU000ZXda?=
 =?utf-8?B?Z0t4cWxjWTZqOEd6MDRScENZTUtYdFdwbWE4ck9sbGozejVTVW03Mk5YVERF?=
 =?utf-8?B?cjNQaW1EMjA1aUxJdktWdjlLbUpjc2k0QTdBRnYwVWxDYk9WeHZ1LzdhT3BT?=
 =?utf-8?B?djg1ai9SWStNMmwxeUQ1SnR2dWxIKzJUSXlkVTRJTStJYVNKNUw2OXBQOGxH?=
 =?utf-8?B?cXVNeEdnN3h5TCtleGtxbG5wdGlsOWVXcDI4TURPQmMwNTNkVXVWU2FMYUVM?=
 =?utf-8?B?MGtYbmYyVnEzbEhwdllWUlduUHhhRG0xU1lkOXlNSDJzcHg0T3dnWWRYYlVX?=
 =?utf-8?Q?sAon8iX0dTdrA9YvfnuGy2DiV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E245AC7AB5599D4DB78FC055B14E82AE@namprd15.prod.outlook.com>
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR15MB3702.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c693e6-54ee-4f4f-27a2-08dc8a5781fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 20:46:02.6920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: egizsDa6T5ouVEySc7kCgs0hkhieLcNLKnsLAIRd01blX7GXbhmKifFpPtJZzbykD5gVJVrEFpCAJy/rRtIUTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB6037
X-Proofpoint-GUID: ZiStd4CduvjErLbt8YMA7rs5a16mDVaZ
X-Proofpoint-ORIG-GUID: ZiStd4CduvjErLbt8YMA7rs5a16mDVaZ
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_09,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=951 malwarescore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110139

SGksDQoNCkkgd291bGQgbGlrZSB0byBhZGQgdHdvIHRvcGljcyB0byB0aGUgU1ZTTSBtZWV0aW5n
IGFnZW5kYToNCg0KLSBXaGF0IGRvZXMgVFBNIGxvY2FsaXR5WzFdIG1lYW4gZm9yIHRoZSBTVlNN
IHZUUE0/DQotIElzIHRoZXJlIGFueSBTVlNNIGJvb3QgZXZlbnQgdGhhdCB3ZSB3YW50IHRvIHJl
Y29yZCBpbiB0aGUgVFBNIFBDUnMvRXZlbnQgbG9nPw0KRS5nLiBhIFNWU00gY29uZmlndXJhdGlv
biwgdGhlIE9WTUYgaGFzaCwgZXRjDQoNClsxXQ0KaHR0cHM6Ly90cnVzdGVkY29tcHV0aW5nZ3Jv
dXAub3JnL3dwLWNvbnRlbnQvdXBsb2Fkcy9QQy1DbGllbnQtU3BlY2lmaWMtUGxhdGZvcm0tVFBN
LVByb2ZpbGUtZm9yLVRQTS0ycDAtdjFwMDVwX3IxNF9wdWIucGRmDQoNClRoYW5rcywNCkNsYXVk
aW8NCg==
