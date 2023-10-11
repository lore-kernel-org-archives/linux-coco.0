Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7DA12E6D
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXUftATp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697056947; x=1728592947;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=k7DjYgXyNFjSPlzouVA/mJdhFRNC08UHSOcElwZzS9w=;
  b=XXUftATpI1M4ODPVlmE8ul+HIqpkmi7qbPCf+fdunBOZLCURGRdG1T4I
   9tq+uCs4IiStCqLBbg4nLmPxIB1Cxlg1AtdnG6G75Pqtii6eDNrW8s9uW
   UINJVlp/T+IP9YTO1PxTwKRKMEX3DDV6UW7M8dSpWiVCiUQFARtX0PNXg
   Peqe+YqwPAtfvrCQuNXiWNYq3Ma/Mwl80+uLd30xs8H4cso2vQzDCNEo0
   kpZLick8DIeZb6n6Fc03rEQne21pdN2nYXyo8I2OUxRSeuAp/cnwesRNX
   qgdY9DYepqSV1gYlCatXP8UylDt06IbZXYoYfnTo7DZoFM27CCzMuyVZD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388625310"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="388625310"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 13:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753966772"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="753966772"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Oct 2023 13:42:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 13:42:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 13:42:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 13:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oK56cm8nLT6ZlCpyk462HxdU7u1RcyRq2btCzPBbceWtpvPmQ/YrnpmykwI3MbeRg8M1JvtEqpN0cgAS8UULLByuniBSnAYv03q3L0fv5SFaRUrnlVtoz9GDoCeTowCfgBg+vdfMUdKFpqHB1UpLhTixG/3CbcZV5pKo6lUP6Cv4lfpI8mjFHSHHvCZ41szmbG707mh5EAW/joLJT9kaNbeaVCPWaiANxBNI9kQUZhw5Q/PDY00ZtN9g9zTPNDAM0v/KVYAqAaMxpQJtyz+qgrffaLjJqIw303LzwX+mcDTp+pXYrhiq8R0BgFMsWNzTnepNg5nETtSlah+OzBfI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TNufaqbB5/Zx2CsAktqKiERM2nXT10APk2wyXoJJ8Q=;
 b=AsMTkLS3zlWz3sYFBCz0IS5zxMG1VlHp8fYGVeJMkSSso5XA3duS6P/G4/i69fJF5tABmS5VSl2FfVpOydbJYAJJVOhvOBWBq9xWZP0k1sveBVS3qXcxoViOtqTlQ4RLjFEF/9rzExALj7MWmCAU+LxD2i5Bon4zOq+JUTAOIYOLl6xs5Y2zYutLSJsEo8X1HA4SNkHELZoPin9l4RYU+0h/RoNv4zWXN60KPsPh5BAJkKNOq/YMOUa9wj9A5wn1cDZSfWC3E7t3fiC0nvJAzB3s3/eezSPz14bUfF7quH/w9T/KJ5X/2ssXhJZ9lZaHSDaXhjAVPitiAkjKu+XkaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 20:42:02 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992%5]) with mapi id 15.20.6838.040; Wed, 11 Oct 2023
 20:42:02 +0000
Date: Wed, 11 Oct 2023 13:41:58 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, Tom Lendacky
	<thomas.lendacky@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, "Jeremi
 Piotrowski" <jpiotrowski@linux.microsoft.com>, <peterz@infradead.org>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <65270896e90f3_780ef294c1@dwillia2-xfh.jf.intel.com.notmuch>
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
 <CAAH4kHZkWYT5i=5EVqywh7jk-00kcXu7h4vbz24fTwAm42frVg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAAH4kHZkWYT5i=5EVqywh7jk-00kcXu7h4vbz24fTwAm42frVg@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:303:6a::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1ba238-06ce-4707-c2b7-08dbca9a8531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JL4WF70UJlo+yOAg+pTAtTdsO+Ul7cfKSH9V8LgEHsX1ibC1d/RZH+agdlJPDA85BO7YFnwojnKxAS0McZagQzUFLPz8aj1It44tnLpOkmKV2DfyogZYy/PmkuGHEfFMtSCMBIqVdEIoTbO7/6ZONoPesbE0q1QLavWh6SnSPxB22WxQ7Tq8ToG6Tmxn0h8HxpRF5XDLYyZ4nDMMzMUX/K+sOLv/m4nNPCuXxw36yjQEpJPYXr4ii9xiwKSLJ8XpzbuEjGxomqkyO9asUbEFnOcNzvu+fNoHfVD+UViKQsKWCCXslFb4TJu4WFW0YxXwp3RqK7acnw9n/jiF2K9hUhHUR9dx5gGO014tzpj6PIcytoj0Ggy/z/qnAqapvsa0nhatvYKqVEl+Z+feJu0xfpVKCMQq22tWHcvwnQ5Kjf3WTGRvMsIW1oauRni1Zb85OMRlhigiFggtJtf28iTkYzkJaWOy1b9wSP16F6fgZAG9kr/K+hHOacW3fLz1sqFy8gYhBumEeQ/k5H9LbHSW75K1RRgLzcgS4iwOhSll3duvdZ/pHL1JS8SZ0OBeTYC1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(41300700001)(6506007)(9686003)(6512007)(82960400001)(316002)(86362001)(478600001)(38100700002)(2906002)(66556008)(8936002)(66946007)(26005)(83380400001)(4326008)(5660300002)(110136005)(8676002)(66476007)(54906003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4me6vGgjLLqmDq5FAaqbZv+J9re79n9xYRfXjPgPx9np0RbR27coez+iuh3?=
 =?us-ascii?Q?t/wBz0YDn9JRKUB5Zoh4Sz/8TPx5Q548K/zE2Ks1WSV74coN/wwTivat4i0v?=
 =?us-ascii?Q?m7GnuGcLrZnS/kJFXnxTWvkrddiU2df0oNbijvyM8UifDsAEQ/vW92jYD8ng?=
 =?us-ascii?Q?A2zRdQGDEhErUhuX/lBPIYc8KXvsUU6eY49CRosr8vlkBkcByr/yEQzqs+14?=
 =?us-ascii?Q?spgx0UNdfNT+a4U0YF6jgA76Fqrk724py31oRkEtgHYYJCcJQfLCb62bVV7V?=
 =?us-ascii?Q?Zi38r9H8ChX4jxg1LJUbbVrgTDnGhFLuqTb4JvHzyW0J4ecQki4DARUAWA33?=
 =?us-ascii?Q?lLdHHSkNx+LNs8HXRLUeIdrP4D3GAJU0B79K2kFhbNl3OAPOWO6n3lri0/O8?=
 =?us-ascii?Q?N5ADCTAabaAoitW9zNcvdR7NAjWKi6B45hw0biGYXkKXIJQ28IysMpCSNO46?=
 =?us-ascii?Q?piVr98XchTEuk1HajEbCOfVWlsT6NR7tMiYTaHmEdvQ5IF20YMm0D2ij1kp2?=
 =?us-ascii?Q?BGhGRfmFEAdq2wxwBVXiaq1ys6zz6V5gM6OuKFNzWkMH+m2XYtD2g4jbXW5O?=
 =?us-ascii?Q?piSru4cESQtDf39BnNLOnULELQX5G61yJQ4cMWSOPPlYAx7TjVBMVCcWN0uK?=
 =?us-ascii?Q?1pQXnb7w5GX/BPIR4FQR7289+kg29o7QbZQ9XhznS2GycH/tpBW8+jH9EixN?=
 =?us-ascii?Q?EFu62uNF2D0+LUblZ4eGwjRjEttLhEMRkMILfg86qJYjyCS5tcXfSjrJWfOs?=
 =?us-ascii?Q?spOdPZHEmVpPwq9HlUXBTl2W+YVjM5efdwq7KVBYNrjdoX6neumRU1vOHlpM?=
 =?us-ascii?Q?bdezosaa0VdxmXR+u/caBk1W6iaDQvc9dQw/3jLK38lfC08KkxLmBahG16KG?=
 =?us-ascii?Q?py2qq/4BLbjHfQOP3/CXVGFkKJIxVQ/vRtxkTeO6Yv7Vhg8kUM3O8C/r0OUs?=
 =?us-ascii?Q?VX78z6sXc03MNh2S39p4mT2kFObjMR7lEz41aXXR0LnuT+5sb1Liz39X0JNp?=
 =?us-ascii?Q?CzoxpC0PmUDn7SAomTr+DhXIOkU+6FwwZeveYa8z3IVV/xuzwAGJsjxFCNCE?=
 =?us-ascii?Q?huzYZnmJetVd8Y/0ZwlCJHwqW9zz+GmSzym2SXLH21BlYca1KCiORlKHOFH6?=
 =?us-ascii?Q?tE6te4AgtpaQw/Tk4JGGzdzbFIm+XNjeZiGSrnKyDEZ07CQ8phPEppTEdmeN?=
 =?us-ascii?Q?IDAYGf+ZnHdnLbMHSHIMlWB/FBZhnXG0SDIRLt5nRNViOVvK02diKfbTny9L?=
 =?us-ascii?Q?Uk8CMXOJfKNYzn8IAPTf6QaFdZx6dXBiRawG6McCxnowYvkp37PtGYE1N60B?=
 =?us-ascii?Q?TlEO5XQ9/0CNAANvXubF4UeA2Lnxd75iz7gX/WZz2R3H3/kuHfS99qlPzpH+?=
 =?us-ascii?Q?Eoez6uLy8kHy2NiYUp1wg6WY55OXouXpNmN0IIg4DhGKXms8j2b8Kzr6IKPU?=
 =?us-ascii?Q?UwkEtrGw0+EtuC1+exQkBWUdIpWuLbRdMxdD52CoVaWkdrcPTHimfYaeXnnb?=
 =?us-ascii?Q?Az3ltr1Jb5tBZv5KkrzCO+7Ad4e5AaeQYgcwHNacJ2LGpSLTv19Xj/br81Tt?=
 =?us-ascii?Q?exyW7vKTjXWh9NPiW1dmAHIZ+qnX4rMhKIRkwoSdpAIbeakuVpRASppcXwOP?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1ba238-06ce-4707-c2b7-08dbca9a8531
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 20:42:02.2694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/MX66MYwxLE/hJgDK2LeSg0L63TvHM0wpFQtXUX/YYzmAsmHvQuFYv2Rb+8ob8XMPtTdqVy/DgmGQyvpcgu+a2wMmaHSVfYqFcUGyduQFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-OriginatorOrg: intel.com

Dionna Amalie Glaze wrote:
[..]
> > +       /* Concatenate returned certs */
> > +       for (i = 0, offset = 0; i < cert_count; i++) {
> > +               struct snp_msg_cert_entry *certs = buf + report_size;
> > +
> > +               memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
> > +               offset += certs[i].length;
> > +       }
> 
> This concatenation isn't going to work

I will note that v4 had this as well, so the timing here is not great,
but the feedback is still important because it affects an ABI decision
and "ABI is hard".

> since you lose the identity of
> the certificates. The GUIDs of the certificate table matter, and the
> concatenation isn't necessarily easily parsed out.

I notice "isn't necessarily easily parsed out", leaves some wiggle room.

The rationale for the concatenate proposal came from the observation
that conveying certificates is a common capability between SNP reports
and TDX quotes. In the TDX quote the certificate payload is a:

"Concatenated PCK Cert Chain (PEM formatted)"

...so the thought was unify on that common denominator of "concatenated
certificates". Is that an oversimplification?

> Consider our use case of providing not just the ARK, ASK, and VCEK
> certificates, but also a non-x.509 document that is a signed golden
> measurement of the firmware. We may also want to provide the VLEK so
> the endorsement key selection attribute of the MSG_REPORT_REQ can be
> utilized to swap between VCEK and VLEK. I don't believe your patch
> here allows for that selection either.

To date the kernel's snp_report_req definition is:

struct snp_report_req {
        /* user data that should be included in the report */
        __u8 user_data[64];

        /* The vmpl level to be included in the report */
        __u32 vmpl;

        /* Must be zero filled */
        __u8 rsvd[28];
};

...so the design was only considering what was called out in the existing
ioctl ABI.

When would the key-select field of MSG_REPORT_REQ be non-zero, and would
that be a per call decision, or is that selection a fleet wide policy?

> By the GHCB specification, the host is allowed to document their own
> GUIDs and provide their data to the guest in this data blob.

What does the caller do with these certificates, or are they only
conveyed to the verifier?

> I think probably what's better is for the configfs to just create
> GUID-named files with the contents of the entries, but I don't think
> just inblob of length 64 is going to handle the VLEK/VCEK selection.

That's a possibility. Would the kernel need to invent GUID to represent
the TDX quote PCK cert chain, would the kernel need to un-concatenate
that blob into separate files?
