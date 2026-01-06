Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11020100.outbound.protection.outlook.com [52.101.56.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC3226CEB
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 02:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767665561; cv=fail; b=mEbORXozh06/e3o78FcntDF3Swxj76oZCwZTxWVNgKPHC+Fo2IAso+CsVTG2wAFynQtaKkGg1EE8HpBt3Rre26s5epWzaEIR9cBXol93ZE21R3m0uj9xTJNVkEi+8vORYqYPFcGm7NDwRnOOd5221wDCIGfxJXeLOEqR5vonSOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767665561; c=relaxed/simple;
	bh=m8kVn1VFy5RF3N5jYheBLndniE4EM1TmNUcF7GNZ97A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=of6KxXqD4z3Y1Qvu4kC6UsrFy+Xn+y8QoTDO8v0t10WuacCSiFO82N7Wys1RotvWc2NSmTguSlNlWDT2NnXnb2kQSOJec9N6Uuymkb2vyndCyOdkIJC27YlJwXwgMrKZk46AoMHyqH6bodEUGTEzAUIvKy0Za8QkNoBnLvHGLbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=BkQ9KHdn; arc=fail smtp.client-ip=52.101.56.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="BkQ9KHdn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsxOSevAkDpk8nmgrvOzLghS32yGRG5Eup+FAQKAVePsbwceFaTBbwgvVvHB2GQbAMYATqNk8AT1tU/1golrw2SiIGtyWks0JlzIYqREYoednOonWV3N+GwIs0WYtZRFQ2oSTa0M6gBHt7HMOH5usIuY2gifW/rqAB1zZp3v6/OZ/qhLRg2ItmP/zuiUdQUtpyWeu8sN/DQAyFiDC3P1II/A7KIYLyZqHt4zv4KrLrtCRvGUVhc2EH0JAFPyHTCknACgllrQn15Uh7ah8Y+al+tnNmwRs1LPO/3l1kAJnmCxgQF4R4w/b02G1gxE98zTh842ypDLhuczJZ2/fNYY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM0mFyfpUCNa01UGj4Y8ZPoq5XYnACuxFnuoLiS6S9s=;
 b=doqeHy2y+qbUkfTyP4XHYzk49oqGullgJxLpyMvpvJQ8KDcncYCPRb1BMspcUmKWABO14Dgw0RxRnVCT6Ry81ZhGYHC/luh0a1Y4P+DLlOWhc+bOJQ2hPGQC9S6bDbBb4tc6ZyWlDlAzHy4S0/HucoGmhpYcLNvdbBproblzw7EkgUYXd0GaMGVHf5ggDhf8G5geHlbfVzgrO1uVWQK8N5RolPaJm62szeyHcXoAraIYsAt7dOCNu/+OCAcvG/vKbMLH0Hxu959UlU3rfu15PN71K+JV+UcRwCT3wSm9ZTUZDKkA8xcGYpOydzt75Kb3mNdCsiytrbq8IIkXv7XWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iM0mFyfpUCNa01UGj4Y8ZPoq5XYnACuxFnuoLiS6S9s=;
 b=BkQ9KHdnmuk/Q9LCiwAM9fmTsdHROD7ea0IfRcX7XbsGVQ5b64Kq6LD6O6TKd61+LXagWhUDQBkcnIywG+dnnUOy1ur3Tqg4sYSbNMqlS6+Wmk30PhUIOoj946/GDNpNf/UDU0z5B9xVEZgIWI8g+JyGxP2FQg1n8fEpIyBFQ7o=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB4718.namprd21.prod.outlook.com (2603:10b6:610:272::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.0; Tue, 6 Jan
 2026 02:12:36 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%5]) with mapi id 15.20.9520.000; Tue, 6 Jan 2026
 02:12:36 +0000
From: Jon Lange <jlange@microsoft.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Dave Hansen
	<dave.hansen@intel.com>
CC: "Williams, Dan J" <dan.j.williams@intel.com>, Sean Christopherson
	<seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, John Starks
	<John.Starks@microsoft.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>
Subject: RE: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Thread-Topic: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Thread-Index: AQHcfq4XYhO/KJhX7E6XCcTuSBNvm7VEYYSA
Date: Tue, 6 Jan 2026 02:12:36 +0000
Message-ID:
 <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
In-Reply-To: <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=629509a1-7d71-47f9-9a18-c1676f00fc56;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-01-06T01:54:47Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB4718:EE_
x-ms-office365-filtering-correlation-id: f6caa617-dd9c-4b17-4a53-08de4cc90f41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3ubKRv0IiaSeuKdSxv+GmBQw2UdzlBoEqRMHD47e8ttIipNzVUVcQDftHT?=
 =?iso-8859-1?Q?mmxOo/AFzLl8t+sDsWRAn/nOBz5TgbpceBFKsU6pPE36LeFt2motmhSPFi?=
 =?iso-8859-1?Q?x+JBr6mKYvhk7oKxmenhFeaBWnVLVZL0z7Y6uownSvbAHJBDwkDIk2Qjhl?=
 =?iso-8859-1?Q?UC9jYEBkVhwLZbwuliAPB69Me/r+2Z4xfrLr/5CJ0GBirdOwbnERbQLO/2?=
 =?iso-8859-1?Q?huBl6y7xhIIlg2WMyTLO9Vg91gKVm7GuMIqF9fJiW+TCdWl3cpbXruTnaZ?=
 =?iso-8859-1?Q?1el1dYzQfu7kan4uq9L2kVXtcKOvsuEZ6MEp1HzPXqOvTzl7mcgIKJ6ypZ?=
 =?iso-8859-1?Q?3eT8oNxCLG0nF9w4rEqaUSQ9Umg5wdWIIQkdACSPsz6MmpQ9RIXhSS2Qqd?=
 =?iso-8859-1?Q?Z+ct7UFbeYmDx9DJIlvzu7i5WBM5QR+6viMoI9ZukUF8ktKi4q18oig9RF?=
 =?iso-8859-1?Q?A112yVbpsY7CFYyI/hxK/Kk4+z5Ckxg7wE/Qa7aBCOkpLONUhkYOS0PRzy?=
 =?iso-8859-1?Q?HIuh5KAHZET6jlVJVVBsTDF5DLSll8o2Q1qApScNdBhl9VaR7toMioz1lh?=
 =?iso-8859-1?Q?wijAxEzCJD6DK8hvGfg9j/xeTXkZcgCEPU/6QG5hPlWPDIQA/4tiz81VMC?=
 =?iso-8859-1?Q?/YJbd8SRTEWdEIhV4qNDHxEM7t0cov1XDLyvQO/rtxAaPYWNuMJN7Z9rvJ?=
 =?iso-8859-1?Q?/TduVLulxEM+iSLMXtXEcYg2Xhl7c86V+TNzMkHrFVSZtWb5vBZ1giYRzr?=
 =?iso-8859-1?Q?Z4ki9VapKo8G5soigqrXi9w6eMsqksxWSk7eaPOsg/3ppGjOpNGDlN2pUN?=
 =?iso-8859-1?Q?mxoiFUhaLHgJRtnb+pExhInFU/fR7wC76mZef0ow2Ggad6kLMIO56YmvA/?=
 =?iso-8859-1?Q?t4BwvPZWFvTbyNOx34HKiD8kB3h8s3bv9OvNXctK9Hr3HHpf8KC3fR9fAO?=
 =?iso-8859-1?Q?YRrsrDJq5rRKvyLdLPEDBaTjTfcZ7TDcThDlvKz2w/WR80jci+J/5+8HLh?=
 =?iso-8859-1?Q?80XDbfigU8Jxw6GOWPKNFQAFz99yk5R+dAZk3fCM+ntVDsMCmC3qQZM92n?=
 =?iso-8859-1?Q?yiJqqCO7ClmcHFYENUxlySoip3raY+IVA4zMuRH+j2Gx7x6Gk3eMgnqnbY?=
 =?iso-8859-1?Q?WmgUsp15aKpwc735jdtaBz7079L71yJiTp5kGSeBTLTWpdsTBmPadUD92b?=
 =?iso-8859-1?Q?GJ4H97gkT5dN+QpmT78JpyvZXeQUtyf2rPAfdmpc9ZGgyDCrqVNKvOz9VD?=
 =?iso-8859-1?Q?0nKmKIbhIDHjfGF4KUJq1IvyLx1cguzZrRrBagci7ne1x+KSjE5eD/YcV+?=
 =?iso-8859-1?Q?zgvBq1HJiLdxswO8jK3/jyRXPn4tenCj99lQc4NFzBOVGRYpVJe35DUuqU?=
 =?iso-8859-1?Q?xXHEp/Erh8MJHGbmp9u4W0mik6EgOsRbMQbUTZ1jSdd6qvIIieED9Kkm08?=
 =?iso-8859-1?Q?gkham2rgVVbOwSdqzpLHn2lWss/SuIUuFeumYXuiFKT9D2y269jJ3xTCxa?=
 =?iso-8859-1?Q?mC1DxEaZhu8kmJtvXMQj01brJchIoRzRtWXeFhpqbq6rfpzCI8q2R+YPgo?=
 =?iso-8859-1?Q?EDzM3aFAW+Tw28YnIG6r47f99pQX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GgbbdaQhMh8WYpq/iP16YMgEcSK4pQxHN1Fi5GvVBMeSxXzF7l3ncK2IVy?=
 =?iso-8859-1?Q?JpuZlf7v+0505hhXY5Ej3aaFl8ddSymTAlIzK9Co47c5lAvUZbAvECsCz/?=
 =?iso-8859-1?Q?7kE14IHb8/DLSKIkNnfknsYZD5BVa55O/+eH6Whgs2VWMfgACHBlCeOcFw?=
 =?iso-8859-1?Q?xekB+n/8CJyhxN/HYG8YzzFRHogZcH4oJRL0Y2nau5OJbe2OrXNGQRC9+w?=
 =?iso-8859-1?Q?Z49bbe1wAV/JcPqUeqEotWGjIaCJeUK/G38I2SUjsC6gKZfp/KLHpdOVU+?=
 =?iso-8859-1?Q?pTnPiU9yWVqZCqckRDPfXYIVr4GOEpxSQyqLK/O1ueDLnRY3lQ6wqX5USa?=
 =?iso-8859-1?Q?O9YRprhl16J+iJxtJjFjDcNm9MC2LHwEaeaiosKvm1oxzegljGFaf2QZAZ?=
 =?iso-8859-1?Q?wfKip+K6DwP0XNh7W3JOb1Qk/B6wd3cz3kNqCaSw+3Qw8ZiU2WkGNGfl1t?=
 =?iso-8859-1?Q?zLQnkwWd43DsY6oFp6Gw44BKqSZzqc1yoewOJe15YkLwE0/f+olqsqRaJ0?=
 =?iso-8859-1?Q?4Z585JoYN10RLNAZQjVeKQp+i5ZeMuoEbnx/nH5251RM8nfAon1+x99Qco?=
 =?iso-8859-1?Q?NwcqhScyx8oq2zBjCcDajOkss97mPWwecoPt1AhC6APECBNey4sskq2k8r?=
 =?iso-8859-1?Q?uFoPana/ZG8rfg2rMc5+X2dnPYTBjifzhyGdLvSSIybBUAJ4FU1FBXiE1w?=
 =?iso-8859-1?Q?VyR7HJM2RPmtxl/AL6OGR7ZV6Ab/w8nBELD7a62Sgw1MsEguDq5SmJLyZN?=
 =?iso-8859-1?Q?7P9Lj9IPJkiCarQxADQfP6fA8uYJo03JUz2xGIaK/OwANRbeU7J+QzZd1R?=
 =?iso-8859-1?Q?MXxoz7JXr8gzDmYcQWXDYmk+4CqubHKVbhTd37WPHyHtPcBO5Mko4ameat?=
 =?iso-8859-1?Q?TfxATFwE9UkEscqnJExeMDyHy5Jfa4oScUlSYH09OeB+Ob5ykNFrsrrmCI?=
 =?iso-8859-1?Q?zHEawb1ti8cRzHc2dhqpvwaYiTiSAxLI4Q0Xdht7h8vcNzNdGVHoPZxrst?=
 =?iso-8859-1?Q?+wMO/MmsGFjzs5KX7aHc5tl1fuIj4m0hgOcZQ/Nl8p7YbpeHnb8PjFblB9?=
 =?iso-8859-1?Q?/XnGkjP5mbWbm8roolc82gU81Ip6S/A/v8NW/wLD3GSTxARTShGuoFSHx1?=
 =?iso-8859-1?Q?M8Q4alHnLiT8lhhDM/BPTbcgRTyVPufTyKgtfI7nfFbtxhkAVLgudfQnvh?=
 =?iso-8859-1?Q?xpsTJgfcF2WqRjQUNhNx6QnPvhmwTJF4rMtpzLzjPxZdtvKDqRyMYPk87g?=
 =?iso-8859-1?Q?qMxCYYA9/qmlqRtzvSOsN7Sy6dmkc71Yo4SqYot4qbx+ab+8HLkeIrLpzb?=
 =?iso-8859-1?Q?pyISJx/tX2HkdET1RPTmkeXoaKYZfNr3412Yp/C1m8ebwrXNaAFpz6YFpI?=
 =?iso-8859-1?Q?VWQ2spLRPA3JzCzRTCiq+RvnI1N6jPjMp21dsHD/ViSaebHYAR2NNztj0L?=
 =?iso-8859-1?Q?r6Y1YyVSbsaow2dBbw2flhgyHBsFgJuNYMpOiZmXk9Pq/yMgxEZF2n+iPD?=
 =?iso-8859-1?Q?jrV8zIAKNC350YWG9aDX0CoPBFdnQDFCdrJg5Ctn1ZIPWrggwBe/wBaJDt?=
 =?iso-8859-1?Q?7jIQrnQi9p2d8vjmMukKT5veqEKJ686V+1cRIL5GE7CgGY8jVwPIAO7hqY?=
 =?iso-8859-1?Q?1LRk0uvNg4BZQktuAuZcBD6ukXjTP4D+CZ3C7Ou5uZEt8ehTrn6bJ5Mv7s?=
 =?iso-8859-1?Q?n5GmgoXkVsLiZX98SbXxL2gHVDDUB87LffMSPa5HhmJnwYSrBqZOlVwQso?=
 =?iso-8859-1?Q?d7q6GDfdKFiZmTA2Kj6c5FI1QC4dYl19L6Vc/ql0wYBXY8IAZE5zLkYko8?=
 =?iso-8859-1?Q?aIMxncu5ZMlMTcTp1PgVouI1T6usi5cWjpVNcUu80jedyKuR+2IJAxCjkm?=
 =?iso-8859-1?Q?wg?=
x-ms-exchange-antispam-messagedata-1: O6p2R+n3Plqh4Q==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR21MB5222.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6caa617-dd9c-4b17-4a53-08de4cc90f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 02:12:36.0773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXBzjfRs7MiMA9czAJQFIojzmUQIGVnjv3Q8AtoszlwnvSOM7YimnJR+Nt9/2xzTqCnx3Ujiamcz9KRGx1SKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB4718

Andrew wrote:

> Are we saying that, inside an opaque blob that a customer provides to a C=
SP to run we might have:
> * a paravisor and an unaware OS, or
> * svsm and a fully-aware OS, or
> * something in-between these two.
> and we're looking a way to describe which piece of the interior stack own=
s which capability/service?
> I think the discussion would benefit greatly from having a couple of conc=
rete examples of data this wants to hold,
> and how it is to be used at different levels of the interior software sta=
ck.

Here are two examples.  In both examples, the OS is running behind a paravi=
sor but I wouldn't term it an "unaware OS".  Rather, the paravisor is prese=
nt because of the set of services it provides, and it is running in paravis=
or mode (not SVSM mode) because the implementation benefits from taking ful=
l management responsibility for the confidential trust boundary (e.g. deter=
mination of when/how to validate/accept pages).  In such a configuration, w=
here the paravisor has management responsibility for the confidential trust=
 boundary, all of the enlightenments in the guest OS for managing confident=
iality state must be suppressed.  The straightforward way to do this is for=
 the paravisor to suppress the confidential VM enumeration information visi=
ble to the guest OS (the "SNP available" CPUID bit, or the "TDX active" bit=
, for example).

Note that this occurs out of necessity because we can't have the paravisor =
and the guest OS fighting over who has the right/responsibility to execute =
PVALIDATE, or TDG.MEM.PAGE.ACCEPT, or whatever.  The kernel today only has =
two concepts of its execution mode: either it is a confidential VM, in whic=
h case it takes full responsibility, or it is not a confidential VM, in whi=
ch case it ignores the responsibility.  When a paravisor (not SVSM) is acti=
ve, we have to operate in the second mode because the first mode would prov=
oke precisely the conflict we're trying to avoid.=20

First example: a confidential VM running under a paravisor wants to obtain =
an attestation report for itself to pass to a third party to vouch for the =
fact that it is a confidential VM.  Assume in this example that the relying=
 party is aware of the paravisor and the paravisor's measurements, so the e=
vidence provided in such an attestation report can successfully be verified=
 as authentic.  In order for this to be possible, the kernel has to know th=
at it's running in a confidential VM in a mode where attestation reports ar=
e available but where the responsibility for confidential memory state mana=
gement is suppressed.  This is a third state beyond the two states describe=
d above.  This isn't just a userspace problem because access to the attesta=
tion service is mediated by a kernel-mode driver that needs to know how to =
configure itself (such configuration today is based on CPUID and not on ACP=
I).

Second example: a confidential VM running under a paravisor determines that=
 one of the devices available to it is a TDISP device that requires the OS =
- not the paravisor - to perform the operations required to configure the d=
evice, to obtain and verify its attestation information, and to consent to =
activating the device in the TDISP RUN state.  In order for the OS to be ab=
le to execute that sequence, the device has to know that it is running as a=
 confidential VM so it knows that TDISP configuration may be necessary.

We can quibble about whether there are better ways to accomplish these spec=
ific scenarios - for example, you could say that the availability of the at=
testation device should be handled by ACPI instead of CPUID and thus the fi=
rmware should take responsibility for figuring out whether it's present, an=
d you could say that the PCI subsystem uses some additional information (po=
ssibly more ACPI information) to indicate that TDISP devices may be present=
.  However, these two examples are far from an exhaustive list and it's har=
d to imagine that we won't discover a third or fourth scenario that doesn't=
 lend itself to bootstrapping in the firmware (and I'm even convinced that =
these two scenarios can neatly be handled by firmware conventions).  Defini=
ng "paravisor mode" gives us one more tool to figure out how to enable conf=
idential services without requiring confidential management.

-Jon=20

-----Original Message-----
From: Andrew Cooper <andrew.cooper3@citrix.com>=20
Sent: Monday, January 5, 2026 5:45 PM
To: Dave Hansen <dave.hansen@intel.com>; Jon Lange <jlange@microsoft.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Williams, Dan J <dan.j.willi=
ams@intel.com>; Sean Christopherson <seanjc@google.com>; Paolo Bonzini <pbo=
nzini@redhat.com>; John Starks <John.Starks@microsoft.com>; Will Deacon <wi=
ll@kernel.org>; Mark Rutland <mark.rutland@arm.com>; linux-coco@lists.linux=
.dev; LKML <linux-kernel@vger.kernel.org>; Kirill A. Shutemov <kirill.shute=
mov@linux.intel.com>; Edgecombe, Rick P <rick.p.edgecombe@intel.com>
Subject: [EXTERNAL] Re: "Paravisor" Feature Enumeration

On 05/01/2026 9:42 pm, Dave Hansen wrote:
> First,
>
> Jon and John gave a talk in Tokyo about feature enumeration under
> paravisors:
>
>> https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flpc
>> .events%2Fevent%2F19%2Fcontributions%2F2188%2Fattachments%2F1896%2F40
>> 57%2F05-Paravisor-Integration-with-Confidential-Services.pdf&data=3D05%
>> 7C02%7Cjlange%40microsoft.com%7C27436f719e4c465067c008de4cc53851%7C72
>> f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C639032607107200108%7CUnknown
>> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
>> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DYr7zgaybC%2
>> FVrIWbX3%2BVkUVDxJz8OUVsSu7EzG2hUn%2BI%3D&reserved=3D0
> The tl;dr for me at least was that they'd like a common and consistent=20
> means of enumerating these features in OSes, regardless of the
> environment: TDX, SEV-SNP or even ARM CCA.

I agree that it seems like "just" an enumeration problem, but despite atten=
ding the presentation and rereading the slides, I'm still not clear on the =
precise scope.

Are we saying that, inside an opaque blob that a customer provides to a CSP=
 to run we might have:

* a paravisor and an unaware OS, or
* svsm and a fully-aware OS, or
* something in-between these two.

and we're looking a way to describe which piece of the interior stack owns =
which capability/service?

If so, it can't come in from the outside; given that it's the capability en=
umeration, there's a chicken/egg problem with verifying the integrity.

It seems like it needs to be produced by whatever the first code to run is,=
 after gathering capabilities in a vendor-specific way, and deciding which =
services it wants to provide, and which to delegate.

And if so, then it definitely cannot be in CPUID because that needs to be f=
ixed from prior to the guest starting to run, and doesn't express dynamic p=
roperties of the system[*]


I think the discussion would benefit greatly from having a couple of concre=
te examples of data this wants to hold, and how it is to be used at differe=
nt levels of the interior software stack.

Thanks,

~Andrew

[*] Yes, I know CPUID does have some dynamic properties.=A0 I think most pe=
ople would agree that life would be better without them.
