Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4B4B66E1
	for <linux-coco@lists.linux.dev>; Thu,  3 Sep 2026 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445801; cv=fail; b=XbtfGcEH11i+gAg/4/3DzTiQRN2hmiUqctm+LZxY8/96ZRIcdBFK1JpsauJOQOpI28KBAozP9esdlsh2jDXaRAS2WAz97tJ6IJzwkKcju0inxB8EKat67BmE3MrJzbygV8gJRk3MvIfrnZAYGKIVnYJbp68zOUpyaUlf13HeWjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445801; c=relaxed/simple;
	bh=Lcx2N0hjNKcgTFYXp+6DZuprDKMhJHzK6AvBoeGseAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V/dy3/7zaPqv8mJ4yHmeRe3OAM3H10iakAZ/qXQ07yK1p+/RYL+ii+SeqbHglpS+8xW2OXjbkUxcV8J40sy0QgH6pd10aMuscUT6d5QtSV5tvJryh799DC3qG9PwZNvqYl4hDXov1THV4uWeLxb5nYopecWFd+r3rPyiVBDKdxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AMRI3jB7; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AMRI3jB7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds9lksAfYFol1AwBIvkY91ftjzpOQc5UQ/rzFYWNL7mFQVWWJzmz3VjjYGFRmS7m/6/Q7aDwr51jXjLvNOAO0UcfTOqvp6hHOC5gBUZc9AdSytwEeaF4ipAK1DVIL4vZ/MTinxKe1zeWtVD4OA8aRfa2iS3pqIUTP6b2u7N4lpZhk3qO4IUX/t6Rp2XYV/9ZQ1sS7fbQENoKek4xgQiTdkS7WHj4HKuss7AtydtKqHHjdI0Tg8hV1iWQuZqAiqyiEACwc3FmYqk6BU2+N6RWhRdxeMIwQcQnOXIKvwSUmZYQcg1qVme+q40oIL6AQrz0G08gi+YSkEnVvCoqfzuiow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNDdKlD3TEW0ahDHhRbPexTzsDlMoHt6HnuYL1cNP3A=;
 b=a2uyQ/eC47IGPBEP4X0L+kwfQsDC4vk82Qu1pYfWAr6NE6UA8SFNhYuId4DeAdc1kOsleaeQABJkUdbOjKpNTwI8rSMYhdJ/NerMCxQTA8zJhavP8Nby2YioMZG0I2H3TLW+Rvel5tbIxFvnZjcC9aLyO0vGqB3NcflQGQqaKMkGi0NZ3Ew0wLb6N2+8Wc+YW6PvjWj8KGUIz7UdKtcukl5UWIz7tpkqsEYJuIZIE/6nThs1uaSVpaUbFcft9aBi+Cqy0uPCxfqRuXL/D37unnuSlsNgmkf+u4Y1/4aNHa0MOThLHUyiI6DCJaTtHG7ZRprt3TU6gqDX+9rqkGQUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNDdKlD3TEW0ahDHhRbPexTzsDlMoHt6HnuYL1cNP3A=;
 b=AMRI3jB7MqALTcmJ3Obe073CCrYXQSjjd8kCLSanntPgw9Zfy1SDeLyMNNGpsQhAMsUZWzR3ohVWWhrLUxRJKGdgwObHczcWWcdlIqeIxf0ly6yBq4BB7awoXrUZF4X4Rboiv4V4xMUyTpeiAUO6QgUCoIZxMg8qtMsDdivnzrIZcJrHpaYEhAq1M+GOQniuNCRCNBUWNRDbWZ2LcU/dnbvzU8QzO45N0tj9u8YhuASFnYJ5G65Z33nNeq207ifG2bFd8oUnofXV5uFuZC975YWpj7SC/PG9eaIsAKBxVQx5qbUcPCeNmkXSyhDM2w64tRsQpBzCIiDu5swu4xAGBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB9471.namprd12.prod.outlook.com (2603:10b6:806:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 14:29:33 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 14:29:32 +0000
Date: Thu, 3 Sep 2026 11:29:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903142931.GJ4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <20260903-pistachio-tiger-of-sufficiency-eaadcf@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-pistachio-tiger-of-sufficiency-eaadcf@sudeepholla>
X-ClientProxiedBy: BN0PR04CA0043.namprd04.prod.outlook.com
 (2603:10b6:408:e8::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: c4361f11-8d14-4712-97ec-08df09c7c57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L45VuFYwWfzJY8iBvKTGMRnebzV6Df4s053pSfmFTLTBuG/Uh6g2u+5PmUER5amUzUjf8OS8slI1mKYXEtczCZO3hGFB3d+BaBdBg8KAS3AAusDfwbhKZqd7lsM10eZRA4BTJ2ZWi2T1uQWf5bXVCxLlFdfboFZW+yaStH53o8PhDYWizp1crGYfzVL47RKQLKZJXVjYpMdARBZzRtYHAQPHGiC+ffQ0kXvXBiBDDgyhLB8ehcGk3UVs3HL6iJlJ7ryik/YZMKjBObeUMfg0iYdy6on4g61igYRVNtgRjgRXxeL5kfjOBogksdGIKyQzoh51iUM9PdRDtPkVZOp/GnmUjP1vswes9ISbGpGTokdFue+BKkZqDIgPt8zT9SOmIdWoTGrH8E8+1OdA2Ipgb2FpSb4vMNEX3lfAIAHH+KSSZalUo40HBlo3VrWqp20hVdlwRpT+JqnkBUEpVMoPT/eHC57h7MjJlvx3DwK6XizPDPTJQn/Ioyb4fU9Ys9pLQg2M3g63Vn7ZWYJsynXrtE+Ok93sYj5n2KDU7eRziWh6CJsqOmnUOtYArEJ/Ko3tha3yaBIIpdwELtbV8JjU8knswbvBXWrMCSWqa+3TVd6D0CfkvYtTdp80uf2HgGx1ZiyElL1pOyfeY+UkNV34AbQyOM+85QysiftYg2Gry6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4HbhzULcq9IXo2dZJykVFEbTt9TYG8dcd/8o0fPWFH2wGtA5sQZG1U8/w4MQ?=
 =?us-ascii?Q?aPI1sqPpjKN9KhOLYQCapRLi8EtvCKHUVLhnKree4CMfQgFAdI45V5GbXvdE?=
 =?us-ascii?Q?j2qr2xB783tSaRZ6ONwA5FQejgWAuICdkK6j7qZurPvVc7Q0M6FXDjjNv/Yf?=
 =?us-ascii?Q?s9+9CDuNSu0JqEsOGHIgNKfjffgRvK00nfMFEkWpnBcLxnoTW0kj2MJNJsUU?=
 =?us-ascii?Q?vN7INHx/UkcE32pcn0Vma6vWrJ6jQRMzwKJzJ2YB7iZzV2f3NKqS28AS+mJH?=
 =?us-ascii?Q?uFshKdZCyEU1E0EkPwdI2FGFI+X+7LaJN9JhhnVr4yAC5TdQ2oDdbaa+EKSk?=
 =?us-ascii?Q?1CgW218TpGDKl2+mvRIpPW4vO1bLeM3ivPr2TTQJG+kIeq8ZSk78DG9rooJe?=
 =?us-ascii?Q?45vDiwnF3BXjh/XN32GyTZ8H/tXpbzqfgw7RznXsJGQSg5xTSzwOJBj0Cjl/?=
 =?us-ascii?Q?VRhliRkwsnjLq7pPItY3vYqmy4K0Y9L7eFNCeZdYB0LevFF9rTUQl/zk12lB?=
 =?us-ascii?Q?AYCFZjgD7AuHzTi4pJ6kPcwOii4sdebfu4Sej+2O7y9+8yaPs7tY/s41osJY?=
 =?us-ascii?Q?/Wq2v7zYr3cniy9BG52k1WNQMn6SI26Wmy9fegZ0yl+M5bXgd0u/KNgpj8EY?=
 =?us-ascii?Q?IOLB5A3xHmf9T/SAAeRtdCKEr0L9+0a0ODXpQ+HIX7dlOyzB3qcaCO9KG58J?=
 =?us-ascii?Q?eKPZlc5JRgoEp8SX+uR9+b32WMSrklIC9xjwHuLiGWudoVgk/TBlaT+xihlv?=
 =?us-ascii?Q?D1/6d3KUqTgnbN+M+dXg2BWRb+yzT+10urpmDZlTOz9Bt8EqTb6Mfpn8lt09?=
 =?us-ascii?Q?5F0jkFQrbIWR+IaOGKIbLwgxMToaH/bBlvNt0v9dwSlq3aYljZj52vcz8Wm6?=
 =?us-ascii?Q?IZeoVMUd4S4QsekkjCISK/qZp0qrGVV19r5UtDuF29ap2XohYkUHKYsaW97q?=
 =?us-ascii?Q?6eoTZrfS4M7YwCive+lOjOCGItuxcSl2cHUTLotjohrcurCMVAkymIbxtUBM?=
 =?us-ascii?Q?/g4DoUlR/9w+KlfjGe/22L7S3VgjQvsXw0QN8wi0/F24SgDVLzc9CiNS1E2a?=
 =?us-ascii?Q?T7I3IuEiK1GCJuPHjSIZEypQ9EvsbpbYNFx9Y9MMsvrYaDw1zraUGJRwHLRv?=
 =?us-ascii?Q?m5H+4XHB3TS0W92Yf51D2vFAqewwzyHpLeCK8b4miYqa4ZENqeUDHzsZ+EGe?=
 =?us-ascii?Q?ck6KYwGA67wQLHevbx3EzNfaoj8HfYIPof6MoQ8qwaAZTRffMeLrtQiMKHy8?=
 =?us-ascii?Q?nhWLX+FBsor15yl2XsfZwaNdbv8Gut/bL4EOIF1Wzln8q7T9inr50yIvgksj?=
 =?us-ascii?Q?In/k5ENnVO2qPAiP41SxrBuh74g1Fw45AuNTHFQ0GapazjFyoTvs2Nl8W24u?=
 =?us-ascii?Q?lF4S4g2SssdAZk6/sxEwK5ou90xWMchrqu6+ZilBM2ml/OC2rrmqZJjoCIL6?=
 =?us-ascii?Q?iLbzbG3TBLRC5vTn0LgeeyZaJ+cRvvuXFUOA7PfXo30xpVW3mahMtX02yYUc?=
 =?us-ascii?Q?B/To5eKaB1u8m9xyZQyFHDis5MRfgvdRdEv+GSweAER7p+V1vgpdb5qAyewU?=
 =?us-ascii?Q?TcaWq6LTvgUg4FB02OBtaGW5UbO6Z1VoW5S11DStf+Lh+6gmirr4cMTFWI8A?=
 =?us-ascii?Q?ozm0dgpHBhYfQAB7eW24ruR1K5V1OZ/0tAUtKdZvH8d38jiUTgha5Bc1C4Sg?=
 =?us-ascii?Q?ieZ3bHYuPje/m8PSnT6kahnMDoAjWUnL8aP2gTZYCnyXp7dS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4361f11-8d14-4712-97ec-08df09c7c57f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:29:32.8413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtMvQuCl2WFbUwCiLehygoqjC7kycPgo/JiEOTWVOQnevwFS3DnpZyerStNDNWMR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9471

On Thu, Sep 03, 2026 at 03:13:45PM +0100, Sudeep Holla wrote:
> On Thu, Sep 03, 2026 at 09:57:18AM -0300, Jason Gunthorpe wrote:
> > On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
> > 
> > > I have updated the bus to match devices using func_id.
> > 
> > Did you have any thoughts on how to handle ARM's versioning scheme
> > too?
> > 
> > I'm not sure what the rules are but it seems like if the major changes
> > then the API is incompatible? So shouldn't every driver advertise a
> > supported major, and the major be in the modalias and checked by match
> > too?
> > 
> 
> Just curious as how this should work with any v1.x firmwares in the wild
> once the driver updates the supported major version to say v2.0

You'd end up with two match lines, one for ABI v1 and one for ABI
v2. Maybe they are the same driver, maybe they are not.

Jason
