Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793277707;
	b=oBOCggY2oNGc/1pQwd5O8KE1X4GXyBvw0xaX7YP5n2msP2Shnmd5ZsqezA/I3g18oGwS
	 DRdgPBnzHjUwF2NtA/wkmSrC5Av3Lc5ZhMp6JP2u60/lBRrzocWJP05QMmDrBj+V4CzAc
	 oNHnlkfGN17Wl1XmKHQ19tdoHh1pQ1MvLsjmz6WWg+BAaaSc42vWYmm6JNulwdpuG11WW
	 LGXtOnVElASm+Sj683zVmwO/EFbcmvUviZDSA61tD8YchgpFIWihkGSYr/0wMOpYuen0f
	 O/ymG+y122eoOLBZYUejjULTl1Z7q3xb1Pnae74lngYaZtKb+qAFzOCjj3TXRc8PyDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277707;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=b8QmlNLBeDcg8Kp/Ovo0Oj+5LA3wZO0luEv7R7PSwv8=;
	b=zNPAa41nW3RcqDPLBHtq+kiSQbO0u9kAhY9BF51MM7Kdp+9EkrUgpKOSIrGvjCiD0QUP
	 FW1SbAVxmM/eh+CrjU3zyHQl0hUNDjJtlcM+yJ6JhJVybGd9+5fUUqTyjd8/REdOF4EkH
	 +cB4Kn7BrFhwU9pprz2wQAMdBDY4eDtEyYluzFURXnlpGSRRnjU/XHyIZvRah3ixIqFee
	 2js0FOoHzjKaZRFfDitID5AEuWU73MyYzjGRxdtDsU4lG0bsONhPrT8XAf1rdT+QQNOQ9
	 4ci8Vb+71qWLFO4nYCq4/30IUZ8Mytp3EmWRT5oyOJjqxLXcJbz9w4cE4JzrCa5WqjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hWTv4y9Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.45
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F0606A31D
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 12:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hWTv4y9Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnb5bL3zLpeEHxfyMPi7j7KxYKwB5AHCtquRlYsxqq9hPXte7dUGU5euIzyiypD/vFuUigg0/MlSpi74nYaFZErnUOD/dsF7b75/JxugUuEWhIayuz42RbDpKsX5h0hyA2QVOCM3yQC2/WOMqFe8262xFtJm7M2N/PXTfw5EH9Kavw+W21s4C1JaaYeseRpvkRT6/2azXZls9TuDrAU5mTRd8onqV9XB26N811Y6s7aZUeINwaMjzD/jfLQhZfne9tJvyMKTx6b85UMugPDJYMO28XzKrDP/PkLOA8TwfXxlUfyMcQVDeoBkwXc2BxzDIRor9t0Rc4/5QSSZTiGseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8QmlNLBeDcg8Kp/Ovo0Oj+5LA3wZO0luEv7R7PSwv8=;
 b=tNV9DmGK2E02s8nAnq1Kd6MkJ8TdG8j+dFJaDF1985M/w0Zy7qopX7ixcnoSvfpIJo0hMXOLGh1CtZIPV3Bi0IY38sSjECpCc6sQInkDnVw4W+jNUFDYSx7MG82Ds5g2TyaqvnmvkzReSLveV2GpxYHHp+KUbNYKfyn7hP6I7H8I+dEDd4aFT51Ne3HSv7z7uXFxSPww5vrnmLvhavV/ggtyh7FAXzXUBKMt/Y9KqCTb9js710biW+tJuwwP7chkyb0WXemDB4rlU+Yu/wiSoFzeB6VqtD9o6aB4VliBmhEZ475IH9PgtOz50i33qFSRNPd675kLUpH0d4kwDZJW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8QmlNLBeDcg8Kp/Ovo0Oj+5LA3wZO0luEv7R7PSwv8=;
 b=hWTv4y9Z5WQkUyioShHWGDq9OxB11Jp5IwNUFnmsrxVmqC0qiKcspobrsX6uuj0ggFV8z9z+21uOxmzTYAIL655758MZ3+VRXLsxd/5t2mBun+BtC+Hnb+BCcm6iK7IcV/fygvtpWlvvcOlBms2eb/n0etUWGqV8rJm9N0/zm+dtQ0VbwraUhzN9eIbffDnixbxOE7j1u7rnyAUO2EBuog4KUpwC4imvosPGL0KuHoYVV7qPY9exrjDiFOd8lq7HTF9l33jC32g8HWCvOfe48nVhAJVXWZsdyay+h9sej73k7agxN8FGeZN16SQLN226GsIXlqMrZis48texG08UIg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV2PR12MB6013.namprd12.prod.outlook.com
 (2603:10b6:408:171::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 12:41:37 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 12:41:37 +0000
Date: Thu, 29 Oct 2026 09:41:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-coco@lists.linux.dev,
	Leon Romanovsky <leonro@nvidia.com>, Jiri Pirko <jiri@resnulli.us>,
	Kevin Tian <kevin.tian@intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
Subject: Re: [RFC PATCH v1 08/11] PCI/TSM: Bind CTLV attestation to connected
 and locked contexts
Message-ID: <20261029124136.GE3040767@nvidia.com>
References: <20261028152618.1356860-1-aneesh.kumar@kernel.org>
 <20261028152618.1356860-9-aneesh.kumar@kernel.org>
 <9ff72d51-3933-4f2e-a854-c0f9695c0c04@intel.com>
 <yq5ajyn1axb8.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajyn1axb8.fsf@kernel.org>
X-ClientProxiedBy: CH5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:610:1f1::12) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bcf8ab1-0465-439b-1fd1-08df35b9f8c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|261028144727099003|11063799006|4143699003|56012099006|261009223027099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	3b2+ubqvqQf+VEHg0XqG/zuaaIcYcVO5mZpyljKcsxFpUhK8JMfwW+T9b7Y80kpFtRLazymo+21+d59fF90Mj5cCgYjDwhdLe0P9VBdCUApvECKlJIlE58c/+jI9bN6FdkLQ/vm+KjwrAST/0saPdI52I/X0ZQYt7Z5JK8fgDJgBjt6QsJfs3Vt679/P7rp84l8yGcW5akD2q/msXuBxyNMtgGnyXT9ilnZVf8cvJfOCDinMDdDgICb46YgDbiN2zu5M/afRJUSGh+at0E0BAgdHnBtrn/Y3LaZ2HIV1/rHQeqMGeoMqMiGHWzJg7pCwHOGUmlsijyeMwCN3PrfZE7GXbPqkFTmzB7TtBS8jhAwtDC/XEOzkoHbkmgPiQyTvzJBHFGd1YPJgLKWWGxqGbYgsNafLedYxeUvgV+sQ3LLwuJ99oufwgoP9r4GEmaovT0WtN/XirxOkmz5KMK8MWlToNiOnec1phlpYOhW/s0IKSfTITuaTnD/T95o1FbhXGkL/+XgEZnh/uI1LVzi3xiOr4LnU+r4/20+4bNP0DxkMAMXCyeOoo+nU4zu9bIadd16Er6CDy2XOFIctCRZ6Z+m9JlYKkiacB6JfMVuPxnbJJylwpiQ0Kh6zFFW0ZDEs7Iq0ZNI11U+UvM/R0OudkOJZtDBtPgJuFz7H1zOK1PY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(261028144727099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MlE6xgjbrJpcY4FCr4+bQEQl6Rbr6Bk7tX4l5HjwpbV/7kExQf38+pp6sdiN?=
 =?us-ascii?Q?EUN8yeGgAYxic+6nqj7KrO3EVC7Tpz3K1O1DUF1S2VNRaBhUxLP7uThvkcDC?=
 =?us-ascii?Q?/5EIb1XAi71QV/EbMEfDmVYx3HpPbVb0jFy+9LxRpEGLwhkrU6dv+seY2dTv?=
 =?us-ascii?Q?DtLirQiMWP06Ein7mdHuVIjNN1JUIx1mNhg0z1Hr23QYNLPlj9e+qQxvRG9c?=
 =?us-ascii?Q?v+OipWMjXqP9OQyI+V7JRgkMs8d9Hi4KVAMWHGkQn2WtjNmz/Dl0/Mu1znpq?=
 =?us-ascii?Q?bC754sod0a8w528FiOxIycIvhm2Nk4hq/OS9t5TVL7EHKgDRTMMW/O3ynF3h?=
 =?us-ascii?Q?FqARiECpbesxe3FOq4+HIF1lWn9gj3ZzuZxED9cq4DWTT81xqPPkqJEiObdo?=
 =?us-ascii?Q?8gaXjBvnUf5bpC6lCCaBkaJTpDU9OEujBA+28J5BWOPfUyOAcRY6R0qd62WR?=
 =?us-ascii?Q?i1PqhpuQ9p+8nepBDJ1LxrpdwsjsIYgBrxjuiMpBrySeOSLeEyTo1ncn4ulY?=
 =?us-ascii?Q?8fgBFsmMtEn/lDO/qp8vIgxoD9ieXQo5YfApkMp+COHfgKd1qIyOhb9Y8Hga?=
 =?us-ascii?Q?leYiloE1PZLtXsf6uiAFeIR+MfLpEzMdhBQH2N6vL+TIjoFniOgm0H0a8NGK?=
 =?us-ascii?Q?6PbkqLy/Vp/xKcSLKW3X5MzPPkb9QdWAUSn0przydCF0Nm5Rlb7MxGz+K9JE?=
 =?us-ascii?Q?rVzLK8cG+FlYVsiUc5GUyF/K4Z3nyktU8zrSsj6ZfPRjCoMw6OUG6Cmid+06?=
 =?us-ascii?Q?LlNzBpPhH6NBGghXVfnAEVhlRHwjeP8CzE2yjcF9zEDOI9/8OqNcr6+6/YTl?=
 =?us-ascii?Q?GMCFjiJ4+AMspnVjFKti21QSz8btDtXVfCGHtp9z/K62lz4QIMVDhdOimAxk?=
 =?us-ascii?Q?L8iNFWBvqRaCuH+9bBZC693jzJrhird74KzDDeJj2qdQOaRTLbcGkIkfRb5C?=
 =?us-ascii?Q?r/JIpHVL4C5ZmcW6Ee5yPgFzxcu1VT8KsAO8awB6wqtThajEuI2d9QoISU0Q?=
 =?us-ascii?Q?72TK0ennh6clUHVMJYV9PrKoCyYaZ/csx6++2kg/VzhO3+rFdOa0J0Z4LjjS?=
 =?us-ascii?Q?QWWzjrbXejCQC9PXf8+/pLmYRk4T7fj1FhsGEtdVapwzlTFdE1B3fptcfJXc?=
 =?us-ascii?Q?bGIW43EYUJ5W65R7IQAkhIW6sJL819pQxLRdSsY6AiSSjEMT+/JBoQDVVIvc?=
 =?us-ascii?Q?y/WbsryAUxyWQEUNRyNCAyLAzjACPyETYOUTR3PiqmfEE7F4U3lZHO2/NU1Q?=
 =?us-ascii?Q?PvPeK19J/Ogue0lBVonQl4pc//90oeETjS6Pp0l0hvI85o8/N5Lbd796bdgP?=
 =?us-ascii?Q?XiDg29vGaF7kABJu6W5vTeWxD3QD5O+s85bcQYbS8SW5+7aEYoZRjpfERC63?=
 =?us-ascii?Q?6Y1fKNf6byGRNzbcw8lB1eyuA8ycgiqta4cBm1PP0fGqkUzKP7e//RXlvQE4?=
 =?us-ascii?Q?/GIVXiq0EoBLMDY66eX/QY2P4DtmCuyApijdZnzYXivgFhfZWlDEZC4q5KZq?=
 =?us-ascii?Q?PECmbeBnBK9/x06i6+LUp6fyna97BNcIdJdgEnuudGutkRM2/P+l72obbU7B?=
 =?us-ascii?Q?wa5dNT5ylkmmHU4RJ3OqI2TZF/NQ95UifMhDwwd08jJt1kY5aoSwoDLc8Kv/?=
 =?us-ascii?Q?hzqLDBkDBTr2Ohdey3jOxkeePdhIuECqQZx7+Rv+9w/w2VedYGIEjEkEOUZU?=
 =?us-ascii?Q?RoJfJyUmkLDWjUhkSUCdvlznhBTnLdfZOzk6VkOy3HsXiTiK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcf8ab1-0465-439b-1fd1-08df35b9f8c5
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 12:41:36.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyPSGnxiCYeD7gVwhzO+UAH/eduRcVG6NfxY3XoDS8/6Ex6PICQEZnSuWpzF+aHx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013

On Thu, Oct 29, 2026 at 11:00:03AM +0530, Aneesh Kumar K.V wrote:
> Dave Jiang <dave.jiang@intel.com> writes:
> 
> > On 10/28/26 8:26 AM, Aneesh Kumar K.V (Arm) wrote:
> >
> 
>  [ ... 232 lines skipped ... ] 
> 
> >> +	ops = tsm->tsm_dev->pci_ops;
> >> +	if (!ops->refresh_evidence)
> >> +		return -EOPNOTSUPP;
> >> +
> >> +	ret = ops->refresh_evidence(tsm, type, 0, (void *)challenge, length);
> >> +	/* Even a failed refresh may have changed device state. Retire all verdicts. */
> >> +	if (ret)
> >> +		tsm->error = true;
> >
> > Does this make any refresh failure fatal until unlock? The CCA refresh
> > in 11/11 says "failure preserve the old cache", but with tsm->error
> > set I don't think the cache can be read or accepted?
> 
> Yes. The generic layer treats an evidence refresh failure as fatal. The
> backend can decide how to present that failure.

The locked generation scheme should fully protect against any desync
issues though? Do we need to care here?

I also continue to dislike the use of the word 'cached' here, why is
this like this? If someone wants evidence they should get the fresh
evidence with their nonce returned. I can understand hanging on to
certificates and other unsigned data but then what would even trigger
a refresh of that? Something you can't refresh isn't a cache, it is
just the immutable data.

Needs some more explanation I suppose, or maybe I haven't found the
explanation yet.

> > The cached evidence is still the lock's evidence, collected after the
> > lock. And per the cover letter a failed refresh already invalidates
> > the earlier generations. Should the backend decide instead, and set
> > tsm->error itself when it can't tell what happened to the device?
> 
> For the CCA backend, evidence is replaced only after successful
> validation. If validation fails, the cached evidence remains unchanged.
> However, we could instead discard the existing evidence cache when a
> refresh starts.

What validation?

> > Also, this builds on struct pci_tsm_evidence from Dan's March posting
> > [1]. The TDX guest RFC [2] and AMD's SEV-TIO guest RFC [3] both use
> > device_evidence_create() from his July posting [4]. Is the plan to go
> > with pci_tsm_evidence and drop device_evidence? Would help to know
> > which one to build the TDX guest side on.
> >
> > [1] https://lore.kernel.org/all/20260303000207.1836586-1-dan.j.williams@intel.com/
> > [2] https://lore.kernel.org/all/20260924041032.1096569-1-zhenzhong.duan@intel.com/
> > [3] https://lore.kernel.org/all/20260916115159.1938195-16-aik@amd.com/
> > [4] https://lore.kernel.org/all/20260705220819.2472765-1-djbw@kernel.org/
> >
> 
> The include/linux/attestation.h do cover
> 
> enum attestation_device_trust_state {
> 	ATTESTATION_DEVICE_TRUST_UNSET =
> 		CTLV_ATTESTATION_DEVICE_TRUST_STATE_UNSET,
> 	ATTESTATION_DEVICE_TRUST_NONE =
> 		CTLV_ATTESTATION_DEVICE_TRUST_STATE_NONE,
> 	ATTESTATION_DEVICE_TRUST_ADVERSARY =
> 		CTLV_ATTESTATION_DEVICE_TRUST_STATE_ADVERSARY,
> 	ATTESTATION_DEVICE_TRUST_AUTO =
> 		CTLV_ATTESTATION_DEVICE_TRUST_STATE_AUTO,
> 	ATTESTATION_DEVICE_TRUST_TCB = CTLV_ATTESTATION_DEVICE_TRUST_STATE_TCB,
> };
> 
> I am still unclear how this will interact with generic device trust. We
> can only determine that after reviewing the device trust series.

I don't know why attestation subsystem would have an opinion or
interfaces for device trust?

Jason
