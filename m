Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EE73BB30
	for <linux-coco@lists.linux.dev>; Tue,  6 Aug 2024 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722959490; cv=fail; b=oo8TtEJUslu5GN/IdRjK68juWZQ5IRzqCbqUyfmQpUAa+76pd9XoHpERK4HsLFk2asXH7HGjMzxXjgiZV37rRbjqka9/683tyRCh4jjLUCBl/GDWcPZ4F1LIhtmKEfa3eZ9gB4vY/xY8//yu8ZQ0QwswXIDBAeiFm0uDyozqKXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722959490; c=relaxed/simple;
	bh=94Chk+lFPxoSequZBBiQqNRy+iq+N8xlafjeVHRBF8c=;
	h=From:To:CC:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=e4MvIEWGtgNqEUI02V9PsOZpMHuBh9rgEsV9eECoqVdjFvhn3OdWK8qrPxd43yA22DZRw0dt24PcV8cgtDn42V/Zp2JzzwVRDf40bnEyifIdEx1t85l4en4pZlfGZVkp8jPONlxTrxQpepQWE/bl78zTkZZhsqrw130dcyz2T+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ibm.com; spf=pass smtp.mailfrom=ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QTQSDd4d; arc=fail smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QTQSDd4d"
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476DLSYS030944;
	Tue, 6 Aug 2024 15:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:date:message-id:references:in-reply-to:content-type
	:content-id:content-transfer-encoding:mime-version:subject; s=
	pp1; bh=94Chk+lFPxoSequZBBiQqNRy+iq+N8xlafjeVHRBF8c=; b=QTQSDd4d
	403g+SX/oPavgUex2VkH97Mo1FlvhNa1+aIrJ2aSOMCATAIgKH0if+P11I1W68V2
	xGC4f5QCRqydqUDEW7Tt/r6prIZBa9ztbeWDFVpcSQu4lwhwvrNiSDFObGFDx34F
	g6YOyWK/nfcDKf+1BeAc5nTpAeelpeoHdSe1n2Ado31uE6LXSTiGeXZ5HLB9ET42
	aTYOTCY8rWulyyFgRLDHv3MLkXOX8ZF8v24ZCqNQpytdTuunTObkUs9f6Dk0ca3Z
	0oEoOXMN2Glwa0nRyNfxYWBkuJYYE3/IcNpIhPxoRMYazrsJo1UpHXMAwM9MMRnJ
	ohCuodAQ5gZwAA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40uf1hs4b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 15:51:20 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 476FpKsP032668;
	Tue, 6 Aug 2024 15:51:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40uf1hs4b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 15:51:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hahymF+TYW8IMJUCgVcRCOTJO6MwK7pF5BKzDgGzSFLWTuddlyFqv2fMZh24PTUPqu8MXYUmHyFzTZAv2IiCG4vabEBS6n3uh0CRUc0P5sG0Ap9l6qwxvqJbGdJJewsoHytkgxV/EJjgEzkWiMSadsalSJH71+Xo12Qbmhq1VHsXNq4uZjhyryCxCpWj9GAuscUSVQGKt3KNCtnfDkvOwsSIqMT4LJBowkT05H7JFXsFgHygf/Xvt2i/woomlxIm/KaOYfU4w0WAC2ieJqDhZz7AmSM8R/kdL7/YojjtXZ1Bw10X3ZBgMimSPTAGbAGrv25J85gtJlRmT9/esqHKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94Chk+lFPxoSequZBBiQqNRy+iq+N8xlafjeVHRBF8c=;
 b=jzKBlsf/J/tGbbkhiOyCM9uNPxhS5JROHA8l/1bk9TQuYpkx4nL9s4hHqdbXEizS3gam/pKux492VPJ1fAW/Sy6MaulZdcjDU0jaxPKJpKSLYlOtSVBMcBmmHd4p38pB1mMLREG1Ejqhh44PGV3M/hvKDKf64qZwrLrZ1LTCda5RQQtjVkAVtfdNcJ7rzDzbKZ4BfE9hgwFv0pXDgtZ/VpghTHiOr8sW2hwDBH9PSal7mIwcfI2MV/AyKnyzgzYQsEnGKre/K7FvIGYxQyLRl9VNB9RyTUMu/PjU/eNToTlqco24luiAsMZdDvjKzjRiCovWIAVZ2oEvPG0UUXz9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from DM6PR15MB3708.namprd15.prod.outlook.com (2603:10b6:5:1d5::15)
 by PH0PR15MB4576.namprd15.prod.outlook.com (2603:10b6:510:8a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 15:51:17 +0000
Received: from DM6PR15MB3708.namprd15.prod.outlook.com
 ([fe80::62a3:51db:e956:e9d7]) by DM6PR15MB3708.namprd15.prod.outlook.com
 ([fe80::62a3:51db:e956:e9d7%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 15:51:17 +0000
From: Claudio Siqueira de Carvalho <cclaudio@ibm.com>
To: "elena.reshetova@intel.com" <elena.reshetova@intel.com>,
        "dionnaglaze@google.com" <dionnaglaze@google.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
CC: "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "jroedel@suse.com"
	<jroedel@suse.com>,
        "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
        "jiewen.yao@intel.com" <jiewen.yao@intel.com>,
        "jpiotrowski@linux.microsoft.com" <jpiotrowski@linux.microsoft.com>,
        "eddie.dong@intel.com" <eddie.dong@intel.com>,
        "ronald.perez@intel.com"
	<ronald.perez@intel.com>,
        "jlange@microsoft.com" <jlange@microsoft.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "simon.p.johnson@intel.com" <simon.p.johnson@intel.com>
Thread-Topic: [EXTERNAL] RE: Coconut-SVSM - vTPM support for Intel TD
 Partitioning
Thread-Index: AQHa59mjjx0pUOE+zkKK7F9rt5ljwLIaYT0A
Date: Tue, 6 Aug 2024 15:51:17 +0000
Message-ID: <003d1f1d654525afc736d84ec9a9e22debde1785.camel@ibm.com>
References:
 <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
	 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
	 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
	 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
	 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
	 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
	 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To:
 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR15MB3708:EE_|PH0PR15MB4576:EE_
x-ms-office365-filtering-correlation-id: df3c3453-7cdd-411c-97d1-08dcb62f9c02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cEpoeVdIWkZaSGxSRWQwR1JET0p4OU5lQ0FxWDloWUZiVjU3MVo3VjJjRTVG?=
 =?utf-8?B?Sk5wSGNNWWxBWlFhdE9IMkYvNGwxZkZnSng5c0tkaFQ3S1JtTEZZRXF1NDJO?=
 =?utf-8?B?dWRKb2dqQ3dpS1dlZHc2NUp5QndYR25lMUcvWWZGUURTcnlsRjV0U0ZJNWVp?=
 =?utf-8?B?NFB2OTB5Q3ovRlJaN29nQVE3MmxGczJmNGppTWc1bEh5RDhlMEF2RUg1MW5E?=
 =?utf-8?B?WEdhd2ZiazRvWUlJUDYvVktqUWRzNFNIbXEzV1JCcHRTSVlIeGtrK0lnUnBR?=
 =?utf-8?B?SlJOUTlwNU8zbS8vQTBkSlc4aUdSMitNeHBFRHdNNmRzT2ZUWHdCTHlVQXNM?=
 =?utf-8?B?dVVnN3JzaGYxZzVqanU3QkZPTzZLUkF1MTdTVnE1VndtZjNoaWVqOFV6SHQw?=
 =?utf-8?B?dllXWG8vZUIzTkNjUUw2NlVlaVJPSkIxQTNueUVZUzY0ekZPTlVyZUVUVXpx?=
 =?utf-8?B?VXp2a2MvZGxxd1pOSHJDOURlVXlnQ21rdWZFNndMUGpNNnZvelZibmhMRHNL?=
 =?utf-8?B?dHhzUjhXMktZWVRURy9xSW00SWl3YXZWUXN1UERObXBDTWFpbkJrYTlUUHAy?=
 =?utf-8?B?MGprSWFFQkhyNGxiMW5VbTFhMDg2OWwyVEJuY1Z2T1hWa3Yvc0dXeHFWdTJH?=
 =?utf-8?B?RDc4UWdIUWVKZzJHUm00aVNac09JQVJVek9waUNtSlBiUzUvaXdIangveFdv?=
 =?utf-8?B?UXpGVnJzdm5Xb1I5YkprMFBUWU90OGxOdDJFSFVBU0w5bExoNFh0ZTM3d1hs?=
 =?utf-8?B?TG9UTG40K29QV296Vkk3azFTVkh6RVl0R0hBaHd3elhhd1h4Vy9MK3RKRmtk?=
 =?utf-8?B?OVlrMWlNVWRaQTRDMzhJNGlhVWdLQ1hQREo2QVVqVFJrd2pnUnVxODZ2ZEds?=
 =?utf-8?B?SncwV2lLbXVtK0oza1d4ZEpHL2lSbTJWOCtuOXp2djhxSVVpV3ZtRTVRL1Nu?=
 =?utf-8?B?cGdqQzFhOVAyM0NRNFZCQ0RBL1RXNjE4Z3JMMDJzdmc4K01LWWd5UDZYYWhN?=
 =?utf-8?B?QktBTFJtaDJZalEraDRHS3hYN2hCeWxKVnZVRHRKOE94WVo4bXFGNm5nQnZH?=
 =?utf-8?B?c0NPdjRob1Z0RTdnVHM1dURIY3AwbnpOT0NxbHNleGpxRGZ5RnV4ajRHZDI1?=
 =?utf-8?B?MFptY1hBUzR3QUtLRFE3U2xiWVpwOUZaM0lFQkJHejlla1lRc3BMNHRXeGg0?=
 =?utf-8?B?RTFDRkE5R3FCVzE2RkZaOUZqd21sV2grR25jS3lZYkl4UVdOb2lNMXVoWVo1?=
 =?utf-8?B?R0hMMUh5eVZhaXdyQzFxU2tiTW5GM2srdjRuMGQreHRhUlpBb01ZeDZVZjBy?=
 =?utf-8?B?ZndPelFPaEdKL2Z3UDQ4MGI5MCtkZ0lMVE9PdkM4dWZ5ZHV3R2h5Yk53MlZz?=
 =?utf-8?B?ZXdkUkV3UUZ6bmw5WVF3ZFNIZ0w3czZ5aTFCRVptZk9LUnY2Y3RlVXltN2RO?=
 =?utf-8?B?cDk5ZUVoUG5TYTJFcUpNL2c3OWZqUGtYaVByOFh5OGU2U1ZleVNYN0tSQUtQ?=
 =?utf-8?B?VWFlK0ZXVUw2TGo0bW9GQytVQlB5UHNkd0dVTmFxODBCRUdWOVIybGh4Z21E?=
 =?utf-8?B?RjlLYjZ1NEduekt6Yjg4UGdwaWNacEJ3aUQ4OWNBOHBBV3ZYbnFYckttZ09m?=
 =?utf-8?B?d1pjRFRHZytqWDZ1dXcrRmlDcHNhVFRzVDVFNmpHNFdFRTRZKzZoZ21hRkty?=
 =?utf-8?B?eUZVVGFpTHV6S21MdnAyN1RlZExFMFNKdlVGWFJ1Qmp4ckl5emFqTXBUZzJK?=
 =?utf-8?B?VkRJa2U1RkJrQU9nMXNwMnE5cjZVREY2UkNocWs0ZlVmVkQ4N3JGL3UzRzR6?=
 =?utf-8?B?ZGlrdUFUV0Zwa29lYnByYnMwdkRPSW80SEl3cnBjZEk4TU82bkIxV0JWa0tD?=
 =?utf-8?B?WWN0bzByYlZaVUxQdTd0UGkxc211OWtOTjZTUktqNm0vbFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR15MB3708.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S3ltUCtWTjZsMXFSMmo5RTA0bVN0bkluYTUzN1pKUlJ4SEc2THFhbUlscXIw?=
 =?utf-8?B?ZG9lZEd6OW1pZ1J6K1JoZ1RnY1RjZzBoZjdqQ2xLY1JNVlN4ZXRxV2lWNEc2?=
 =?utf-8?B?T1Rqc3VqcFdETWM1bXBmRnlpUkZzWHNrTlJNdWtiTGVaZUlEWnhFZXRZNW9a?=
 =?utf-8?B?elp0bmpMeDdBS1VURnJkZnNGd01zYkV5U2FWNytlMkFTQ0hJdGJMaUhiSEhW?=
 =?utf-8?B?RFNURVRxVnZSWmEzN212SU5jWHNuazNBUWE1SkxvUXljdHdybCt4Z0R1WnRO?=
 =?utf-8?B?KzVob3BuZ1BDU0ppenZXZ0s4NG9XSUNGbWwzRG9CMDNRbTMzYWE1dGY1MDk4?=
 =?utf-8?B?V2JiQ05Ra09BcXV3YWVPc1FWdWM4ZnVnMVROVm90Vm1pdFBaVmY0T0VrTmE3?=
 =?utf-8?B?bCt4eG1pbVYxSlRBbVdHT0hIWG5CUnY0K1hnditaNENHZXR3Z0dZYXc1U3M1?=
 =?utf-8?B?YnNtY3RMZEdYVHJLaHM4bk8wOWE0L1RsZklUOVIzcFYzUXlBcE52Qk5TYXRF?=
 =?utf-8?B?T2pzbk8zL3h2eEVldjQ5NDdGMW10VU1yU2VocndudDh1em9jdVg1WGF3cVUw?=
 =?utf-8?B?TitWOTRuS1I3UitpQVMyeE8rV012djFhNStUK1AwYjRaaGxrcTJ1RjlEOGx3?=
 =?utf-8?B?Q2R4V1hacGkrUy9GZGJYN1YraW4zSlcwODVDbXhzSjAwZzBDTExvSmEwc0pq?=
 =?utf-8?B?UUhMcnhQN3o0VVJZYW0yZUp2WFEraVh6SDFodUMyVW5sL2ZrOXJSNTI2R3pI?=
 =?utf-8?B?N0xhTWFrREIvTE9HZlorQUh6ejFEeGN0VW52NUtPZU5va3hBT3U1dU9BbGRZ?=
 =?utf-8?B?ZmszV1JYL3FJd3dwNytQcVk2UWR2Tzk5U08yUHpBdktXU1ZrM2JOTW1JUHdG?=
 =?utf-8?B?ZzMzNWR3SmVZTldpNStGZllwQktWcjdMenoyTEUzbWtxZHQ0ZklWNjFqZEJU?=
 =?utf-8?B?VlpFZGRYU05mM2doQmdzdy9YTVlJeWZVTmNHclBpQ3h0amIwQnI1eWNrSTll?=
 =?utf-8?B?VFpYeXNxbnhUMDJ1YmtqdU1YaFljQm04b08xYmEralFBZVZEdkpiTXE5ZDdE?=
 =?utf-8?B?MkVMTnpjMHo2NG5GRmdOVXNlb3pPajZYNHV5VjkxSndudW1XTFJGUUIvQVcv?=
 =?utf-8?B?NDBteDdxUUh6UnQ5Q1lPeW13OG5oSGh3Skh6WkxKUHJnU1dLWmNoT21qQllV?=
 =?utf-8?B?N21JVXdKTkxTS1ZtTDBkK0xwMFBIVzhacklrN3VtYk9TY243b2c2UCtXeGVx?=
 =?utf-8?B?b3BLaUNjc0xTTDlsalV6OHRBbHJuMmZhd1kxMkMyUnhwMkFhQWhMSDgvNTNp?=
 =?utf-8?B?WXloRlNjR05QU2xWdEFKdkhwQ1NoZWpXSnd3dExuZFRTbnlWMzZOY3Awb2Y0?=
 =?utf-8?B?RG42dEVIYVlyR1JwdzdBaVRlM2ZQa3ZHb2x6amNTTmVCNXhJcnMzeE9XbWxV?=
 =?utf-8?B?Y3lUVlA5LzJlblBoSWxCV3B4N1FYOEw5bHczV2RGbDRzSXdZUWRUY0x6OHJB?=
 =?utf-8?B?YlE5SWExK0dRMEYzRy9mMEhlWXJkUEgzYlJSV3NaWVZudXp3UzYzSlNKWVQ1?=
 =?utf-8?B?MnFqOFFBS09NTW1sTEJaNy90OEJiRVkrL1VuWFhncUtQQTVIV1VRK1lORys3?=
 =?utf-8?B?VWd2SHlyaHZKTmRXdmZPM3lFOFNDZGptcEVIYTlEQTA1M1h0MnRyU0NINTIx?=
 =?utf-8?B?dlhqWWFlaE9uRm5ZaEtCZDRPKzlhcFNxQXB3YWFDUC8zc1pIeGNURWVjNUpP?=
 =?utf-8?B?VitGaGpYRmNTMGNCR0VvTlF2VnhvSGVWeHVuVlppQ1FRaWk5cFBRb3FZcVFT?=
 =?utf-8?B?azdPYmlJWDVSS0NwcGpYZFdoUFpPQW5RcC9td04rVy9IUmtTbkJKVzFZdjdL?=
 =?utf-8?B?UTBRQTkwOHV0ZFo2eTdoME1BaDdiM1lLc1ZVbDJVNG0zNXowNU9EaXhzbnY2?=
 =?utf-8?B?ZDNpU2xscldweE1oaDB6UzE3ZTM3Ly9xN25NNkpLTEpLQVVnQTR2bnFMUHBD?=
 =?utf-8?B?ZjNQcWtwQUhpS3BTTUdua0pxSUROQjBJNmFCVHhZNHJ1Tk1TR09tclprSWEw?=
 =?utf-8?B?NVBOT0pKYUVlZ0lndWt2Tm1Vd1FsaVFpK0dGODEyWWhnMHVndS94VEpFQ010?=
 =?utf-8?Q?8BGqVkK14wDrlEOgZFkIBAnTH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57DB4A4970276A4B975746C212EA45C2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB3708.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3c3453-7cdd-411c-97d1-08dcb62f9c02
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 15:51:17.6307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+jQAerZyDKnvWbOlkfZPQzzlyUwewtDPAFRiZg8/sRF60cZ6HHrH7YtbQX2cDh0vH/apdjqklyCJWDiV6753A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4576
X-Proofpoint-GUID: Kbc2ahfMc8sN49-Jdco-ZjfelPDjv6Sj
X-Proofpoint-ORIG-GUID: qM8C2SvC6RPONe0mkm-TLDglElurdx2m
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_12,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1011 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408060107

T24gVHVlLCAyMDI0LTA4LTA2IGF0IDA4OjIxICswMDAwLCBSZXNoZXRvdmEsIEVsZW5hIHdyb3Rl
Og0KPiA+IE9uIE1vbiwgMjAyNC0wOC0wNSBhdCAwOTo1NSArMDAwMCwgUmVzaGV0b3ZhLCBFbGVu
YSB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCAyMDI0LTA4LTAyIGF0IDE4OjU0IC0wNzAwLCBEaW9u
bmEgQW1hbGllIEdsYXplIHdyb3RlOg0KPiA+IFsuLi5dDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGF0
IGJyaW5ncyBtZSB0byBhIGN1cmlvdXMgcG9pbnQ6IGlzIHRoZSBJbnRlbCBURFggU1ZTTSBnb2lu
ZyB0bw0KPiA+ID4gPiBmb2xsb3cgdGhlIFNWU00gcHJvdG9jb2wgaW50ZXJmYWNlP8KgIGJlY2F1
c2UgaWYgaXQgaXMsIGl0IHdpbGwNCj4gPiA+ID4gbmF0dXJhbGx5IGluaGVyaXQgdGhlIGVubGln
aHRlbmVkIGludGVyZmFjZSAodGhlIGNvZGUgd2lsbCBiZQ0KPiA+ID4gPiBwcmVzZW50IGluIHRo
ZSBrZXJuZWwsIHNvIGl0IG9ubHkgbmVlZHMgYWN0aXZhdGluZykuwqAgSG93ZXZlciwgaWYNCj4g
PiA+ID4gdGhlIEludGVsIFNWU00gd2VyZSBnb2luZyB0byBpZ25vcmUgdGhlIFNWU00gcHJvdG9j
b2wgc3BlYyB0aGVuIGl0DQo+ID4gPiA+IHdvdWxkIGhhdmUgdG8gcmVpbnZlbnQgZXZlcnl0aGlu
ZyBhbmQgdGhlIENSQiBpbnRlcmZhY2UgbWlnaHQgbWFrZQ0KPiA+ID4gPiBtb3JlIHNlbnNlLg0K
PiA+ID4gDQo+ID4gPiBJIGNhbm5vdCBzcGVhayBvbiBiZWhhbGYgb2YgdGhlIEludGVsIFREWCAq
U1ZTTSogaW1wbGVtZW50YXRpb24sIGJ1dA0KPiA+ID4gZm9yIHRoZSBMaW51eCBndWVzdCBrZXJu
ZWwgdGhlcmUgaXMgbm8gaW50ZW50aW9uIGF0IHRoZSBtb21lbnQgdG8NCj4gPiA+IHN1cHBvcnQg
c210aCBsaWtlIFNWU00gcHJvdG9jb2wgaW50ZXJmYWNlLiBXZSBoYXZlIG1hZGUgYW4gZXZhbHVh
dGlvbg0KPiA+ID4gb24gdGhpcyBkdXJpbmcgdGhlIHNwcmluZy4gVGhlcmUgYXJlIG5vIHVzZWNh
c2VzIGN1cnJlbnRseSB0aGF0DQo+ID4gPiByZXF1aXJlIHN1Y2ggbmV3IHByb3RvY29sIGludHJv
ZHVjdGlvbiBvbiBJbnRlbCBURFggYW5kIGl0IGRvZXMgYnJpbmcNCj4gPiA+IGFkZGl0aW9uYWwg
Y29kZSBjb21wbGV4aXR5LCBldGMuDQo+ID4gPiBJZiBhbnlvbmUgYmVsaWV2ZXMgb3RoZXJ3aXNl
LCBwbGVhc2UgbGV0IG1lIGtub3cuDQo+ID4gDQo+ID4gSWYgeW91IHJlaW52ZW50IHRoZSB2VFBN
IGNvbW11bmljYXRpb24gaW50ZXJmYWNlLCBJIGNhbiBzZWUgeW91IGFyZQ0KPiA+IGFibGUgdG8g
Z2V0IGF3YXkgd2l0aG91dCB0aGF0IFNWU00gY29tbXVuaWNhdGlvbiBjb21wb25lbnQuDQo+IA0K
PiBUaGUgZ29hbCBpcyBleGFjdGx5IHRoZSBvcHBvc2l0ZSwgaS5lLiBkb24ndCByZWludmVudCBh
bnl0aGluZywgYnV0DQo+IHRyeSB0byBzdGljayB3aXRoIGV4aXRpbmcgd2F5cyBvbiBob3cgd2Ug
aGF2ZSBiZWVuIGRvaW5nIHRoaW5ncyBzbyBmYXIgaW4NCj4gTGludXguIEluIHRoaXMgbGlnaHQg
U1ZTTSBpcyBhbiBpbnZlbnRpb24gdG8gZG8gdGhpbmdzLg0KDQpIb3cgd2lsbCBJbnRlbCBhdHRl
c3QgdGhlIFNWU00gc2VydmljZXMgcHJvdmlkZWQ/IEluIGFkZGl0aW9uIHRvIHRoZSBjb3JlDQpw
cm90b2NvbCBhbmQgdGhlIFZUUE0gcHJvdG9jb2wsIHRoZSBTVlNNIHNwZWMgMS4wIGFsc28gZGVm
aW5lIHRoZSBBVFRFU1QNCnByb3RvY29sIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGdldCBhbiBhdHRl
c3RhdGlvbiByZXBvcnQgZm9yIHRoZSBTVlNNIHNlcnZpY2VzLA0KZW5kb3JzaW5nIHRoZSBzdXBw
b3J0ZWQgc2VydmljZXMgYW5kIHRoZWlyIHJlc3BlY3RpdmUgcGF5bG9hZHMuIFRoZSBwYXlsb2Fk
IGZvcg0KdGhlIFZUUE0gc2VydmljZSBpcyB0aGUgU1ZTTS12VFBNIEVLIHB1Yi4NCg0KUmVnYXJk
cywNCkNsYXVkaW8NCg0KPiANCj4gDQo+IMKgSSBhc3N1bWUNCj4gPiB5b3UndmUgZG9uZSB0aGUg
c2FtZSBmb3Igb3RoZXIgU1ZTTSBwcm92aWRlZCBzZXJ2aWNlcyBsaWtlDQo+ID4gZGVwb3NpdC9y
ZW1vdmUgbWVtb3J5IGFuZCB2Y3B1IGNyZWF0ZS9kZWxldGUsIGJ1dCB3aGF0IGFib3V0IG1pZ3Jh
dGlvbg0KPiA+IHdoZW4gaXQgY29tZXMgYWxvbmc/IA0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBn
aXZlIGFuIGV4YW1wbGUgb2Ygd2hlcmUgbGV0J3Mgc2F5IHdlIGFyZSBub3Qgb2sgd2l0aA0KPiBl
eGlzdGluZyBMaW51eCB3YXlzIG9mIGRlcG9zaXRpbmcvcmVtb3ZpbmcgbWVtb3J5PyBXaHkgZG8g
d2UgbmVlZA0KPiB0byBjcmVhdGUgYSBuZXcgcHJvdG9jb2wgbGlrZSBTVlNNIGZyb20gZ3Vlc3Qg
a2VybmVsIGZvciBkb2luZyB0aGlzPw0KPiBJdCBjYW4gYmUgZG9uZSBpZiB0aGVyZSBpcyBhIHZh
bGlkIHVzZWNhc2Ugb2YgY291cnNlLiBBbGwgSSBhbSBzYXlpbmcgaXMgdGhhdA0KPiB3ZSBoYXZl
buKAmXQgZm91bmQgYW55IHlldC4NCj4gDQo+IMKgU2luY2UgdGhlIGhpZ2ggbGV2ZWwgb3BlcmF0
aW9ucyB3aWxsIGJlIHByZXR0eQ0KPiA+IG11Y2ggaWRlbnRpY2FsIG9uIEFNRCBhbmQgSW50ZWwg
aXQgd291bGQgYmUgdmVyeSBhbm5veWluZyB0byBoYXZlIHRvIGRvDQo+ID4gaXQgaW4gY29tcGxl
dGVseSBkaWZmZXJlbnQgd2F5cyAod2l0aCBwcmVzdW1hYmx5IGRpZmZlcmVudCB0b29scykuDQo+
IA0KPiBNaWdyYXRpb24gaXMgYSBzZXBhcmF0ZSBzdG9yeSwgd2hpY2ggaSBkb250IHRoaW5rIGhh
cyBhbnkgY29uY2x1c2lvbiB5ZXQNCj4gb3IgYWdyZWVtZW50IGluIHRoZSBjb21tdW5pdHkuIFdl
IChJbnRlbCBURFgpIGhhdmUgYSB3YXkgdG8gbWlncmF0ZQ0KPiB0aGUgZ3Vlc3Qgd2l0aG91dCB0
aGUgZ3Vlc3QgYXNzaXN0YW5jZSwgc28gd2UgZG9udCBoYXZlIGEgc3RyaWN0IHJlcXVpcmVtZW50
DQo+IHRvIG1pZ3JhdGUgb3V0IG9mIFNWU00uIEl0IHJlbWFpbnMgdG8gYmUgc2VlbiB3aGF0IG1l
dGhvZChzKSBpcyB0byBiZSANCj4gc2VsZWN0ZWQgYXQgdGhlIGVuZC4gQW5kIGlmIHN2c20tYmFz
ZWQgbWlncmF0aW9uIG1ldGhvZCBpcyBnb2luZyB0byBiZQ0KPiBzdXBwb3J0ZWQgZm9yIGludGVs
IHRkeCwgdGhlbiBpdCBuZWVkcyBhIHNlcGFyYXRlIGFuYWx5c2lzIHRvIGRldGVybWluZQ0KPiB3
aGF0IGlzIHRoZSBhY3R1YWwgcmVxdWlyZWQgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIHRoZSBMMiBn
dWVzdCBhbmQNCj4gU1ZTTSBpbiBvdXIgY2FzZSBhbmQgd2hlbmV2ZXIgdGhlIHVzYWdlIG9mIHRo
ZSBTVlNNLXN0eWxlIHByb3RvY29sDQo+IGlzIG5lY2Vzc2FyeS7CoCANCj4gDQo+IEltbyBtaWdy
YXRpb24gaXMgb25lIG9mIHRoZSB0b3BpY3MgdGhhdCB3b3VsZCBiZSBncmVhdCB0byBkaXNjdXNz
IGF0IExQQy4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gRWxlbmEuIA0KPiANCj4gPiANCj4gPiBS
ZWdhcmRzLA0KPiA+IA0KPiA+IEphbWVzDQo+IA0KDQo=
