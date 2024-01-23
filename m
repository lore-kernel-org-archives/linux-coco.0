Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC5A82D8B
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 20:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706040585; cv=fail; b=REV1YdGfp78HtDEFXobw0m3zOsknWSSnSolALSWmURFN3DitH3y0i0R622QJGSG6IhoP7uOQVfmv+lAXH/082c8JsGUoVXdFh5zfKKb9XCm1s0Nzx1g7j7mCgZO2M23KZEfW+UqPGtvegTGkxm3b/zWU4HUoA2J0G3sWT3TKzY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706040585; c=relaxed/simple;
	bh=0zgxqSzaexBVsLikjPPcU13lYCwGa10Ni+FJ0GGB5vA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kRGtL0E5JVIjGkAAcyR5wPxecet9YWvXh9HrLMVzihk9bKc8MgXDskAzodyoTEf71Gmf0e0GE9z1Vy8p22vzpkWClnZwZ1Ruzq9buYzgPJRZFoREWPjE3YOWz+T7trk2aqA95ryTdg5/1jZGfx6ToYCsmYha51vdNQDqHVxPQSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUxg+8sL; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUxg+8sL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706040583; x=1737576583;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0zgxqSzaexBVsLikjPPcU13lYCwGa10Ni+FJ0GGB5vA=;
  b=nUxg+8sLF9dVWlCDDtu8Tv/tkOz9y2AWpNyVIRAamt3pM8VBARYUozff
   x+Yp++7Tu9kkUh8mHkDjsZxFjR0gqGTG/gd/9Hsz8lPTD9kqToclS66lY
   qEtpeA+ihDr2YduhXBSfgt/JchBKpNorTNP/lk0ENoOifp58WRblPzuro
   byuc6hOz00rl7PlQsHEyJnEOthyDgaSvsGp37R3kxDUa88vOOLEvhYjlW
   8b1m/EKPbx+X08Ho7mmELxZR3GhPr35qrHPQcjWN0/O0G7x/vOy1taOTa
   AKzenQy4kIOuyLF0tkrBAijM8LoIrJSazaJiqX1OFUROWVQHxJL/Gnr+m
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8398509"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8398509"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 12:09:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905359004"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="905359004"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 12:09:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 12:09:42 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 12:09:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 12:09:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 12:09:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3Ro8nVpYu0kC33UJ0QYHimsbpSHMHCgfxM44jUWNHUIm0i0qGkJAUB6IQK0JnA3RJQBiEl4/92e7/IzKDnezcdQZdxmiOmSoRoC8Rc+6mHxwYGbqCjyXWLr9iA1ciJDNTaOcs9k8a7zwFlXEDb/Evxyb42drqmpoA8tj9zQlYIHqkGnPSprbtm7Sfv1pziUhu6lcEGYdzzO5bHgcbMDXD7yTKYlrSZAAdTUMj728bDA63jKNrkuIt2e0OT3h8kXKi68YN7fxXUqp52ytQiHo48Q+OjkT2DtY5awITwV338ea8RC4Ay2E+sDUtqLO9Wx4fNQOfm6I/+W5waV0ArZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb5VzqSOQo48Z4lj/69PwqZIxjmb9wGmJ4CeTuLllj0=;
 b=hcteV+khjDF7zKYj9D8ItQEWlW71+YFFnymWzTM40DKi8BKgBSyHIW0d0ddwR2+MOMDg8ZbezXq4sH9StHdUyHQ8y46qeQ3ectSRGN+xe0gBtNpeQN3GgHYUv/MywRoBvlTYXKBH3gBPnzEEZO+y1CmEr7w5YprBwanW4gvuPhz4ZBynSKLAaevy9VzUbPJDsrHhgfMpFDrc9cMUzW9ElpcTdUAgmJndM990VehkdV+GJTVxaU1/VFanVnPX3O+PszZvcEJo92xOgdzWUq85fNAnacjoaUgRVgtMo09Sf49YmbENehEpv2VQ72gE4N69iOabmE3vvNzpcD52xIFqTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH0PR11MB5562.namprd11.prod.outlook.com (2603:10b6:610:d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 20:09:39 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 20:09:38 +0000
Date: Tue, 23 Jan 2024 12:09:36 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, "Dan
 Williams" <dan.j.williams@intel.com>
CC: Nikolay Borisov <nik.borisov@suse.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <linux-coco@lists.linux.dev>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Message-ID: <65b01d00cae32_37ad29499@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
 <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
 <65b00e191087c_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <ZbAaKAh-230Hj4BF@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbAaKAh-230Hj4BF@redhat.com>
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH0PR11MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 524c45b7-5982-431f-9ee7-08dc1c4f3a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A61b1/qGliylzHNalVxYg5Eg/9i4cYyElSVT2kIuUknLIpmctLSC1r695T8kWHboreTI4weSY6Dstw0IGWGbWt32saxNn4kFjY/1heuQM1dvKeJVkI76xFezk8LLHZJ+tsg6dcSQHdem1TcvvIVBIplhcOhWjeuA1RgPeIVsOdkzz8P8FCQqUXjvIc4Qpz7eu7i7beR3aiDt0jdHIhcZOHm6FDsO3pznbvs3lNgIEhY1+cqz7S4unZRTAX/CEybB/FpPtlK/4mEF1mwfekqGN46YaXqvnwFBbMrWMS3WfMjkRWit5hw5tFDjLNhFJ3SiHETCOmCe9JiwaIBGpRMByLGAi+GcLFR3abZjlFcwv+VIE1UvjiAi8Li8Mc0F2DI4BgUbAbS+OfsvmeKIF+0FKmltau1kNgJv8QDxDY4DvFhBG/Th60ZSpKqTg4pUKsQgu6sGbUVycyXfUt+pnOtj6M9Ei7CXY7ZE6ruI5iuFr/JQphy+na1MDZz67ScqKp5e+XFlzi6YtGewpw7YdmoTi76e+qCCSdjxLArlMC7zuRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(26005)(41300700001)(6506007)(53546011)(6512007)(9686003)(316002)(82960400001)(54906003)(66556008)(66476007)(5660300002)(66946007)(4326008)(8676002)(8936002)(110136005)(478600001)(38100700002)(966005)(2906002)(6486002)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWhqRlNDVng1T1dEOEw1akx6Zm5kdERKT3FKMVZvNWtyMm5JTVJLOVZnbFlz?=
 =?utf-8?B?QzY2a0ZhY0U3SVJ2eEZZVFBiQWNiZDVTWWEzK0RFcStVYTJkdk94N2F0WUYv?=
 =?utf-8?B?U3piVzhhVWhudDBIOFhLdmZjY2RCdWZWbGpwblZEQXlnWVNyeFBHek9FR2ls?=
 =?utf-8?B?LzN4MzYrSi9pclRET1BVbnBTc296RU9XVUNXN3ZzaGFuWUhDQVUvUU9DUGNy?=
 =?utf-8?B?ZVJ4ZnBXSkViWWlQVTJOeUtMMDc5QU1VdSthVWk0Z2dQUzIzR2Z4bnFEamVi?=
 =?utf-8?B?UDNacWdQdk9DOURmTzN2cnRLT2FaTEI4VUFqSkdLaWhlTXRSQW55SWs1ZHNN?=
 =?utf-8?B?OGJpZVhwVm9KaFIrVGs3L1RMSk9nc3hBSllaaWhsUzZCakQ2VWJzUEJPaGlD?=
 =?utf-8?B?eFBTR1phZGZQU0NINHJ1YllyakpDQWsyK0NZb2x4OXFpU3JVZUNSSXpBZlJp?=
 =?utf-8?B?c0dlc1VwcE1HeHN3MFpYR05MQXBnMDZNNXBEVk1Id2loUyt4cUJLdEprTjhD?=
 =?utf-8?B?T243YjVaQWYwa0diV09PbldGTlRCOEVTTXlIUzk4a0g0UUdlRzl5U1RBdjl2?=
 =?utf-8?B?a3dyNDhKTitNeEp4TTZudm1FaXdGRURsUmlTSmtVMkVZMUh6Z2VuK1R2cS9R?=
 =?utf-8?B?ZHVHNzNFdERJTHZmWTRBVTB2cHRPYW5aNUpDL2h4NGt6YkdBSm12ZGNLM2xn?=
 =?utf-8?B?ZjA2WDNlNVZIL1Y0aUlsZG8wb2ZaU3BvRnBNNVdQYnlNN0E2dzFZUkFib1JQ?=
 =?utf-8?B?bUdjalBuOTJvUmpmYkVIMFVDdG90UlduV0kzWE5HSEFCWGxVZnVUM0tjNndJ?=
 =?utf-8?B?dFhqK1M3cm9UQUVodzdOQ0FwQWw3U2REOVZ5VW94TDhXYlgycUxnakZKRUtQ?=
 =?utf-8?B?eUVhUzZVWlI1eWtycTVUQjJqb2tINytkMm9DTVZEeTlQMXlEdlFCbkJrZndV?=
 =?utf-8?B?ckp0anQwMEU3ZW9VNHRzeVE1Wmp2NnRSRzNhaTVVNzBPd0ZkUFp4a1NRZWJa?=
 =?utf-8?B?L2M3OWJ1UWFHOTJyUmpBYWczM2dzVk1LeEVyVlpHRC8zclhxQzBSbWVQdGJM?=
 =?utf-8?B?UXlRelE1S1FLVnZOYXRjcVl3V2JqWm56aEdIaWt6OXQrT2VoMXkxTEgwV21G?=
 =?utf-8?B?eklvVFNabEpRRFF6WDF0d2tNU3h2TGZ4ZkdtSkxYb1RqR2x0SDlOcTIwNVlE?=
 =?utf-8?B?T21yczZlRTYyc0pMNzZSN3haQzNWMkxvQjIrWlVmMnJaQ0tQVTNDS2hrdUFH?=
 =?utf-8?B?TUdrZTJETGlLZ0I3dEQ4b1B0cHBTcmdqbis3VWpIaVBPYURKd2lNSjcvMkh6?=
 =?utf-8?B?dUZtVUJoc3JXZDIzSitwUDJNdUdTNkNaTHFmVzFlT1hzeFhkWXVSREpiakpP?=
 =?utf-8?B?ckJtTkJiYWtrMWRYYktIL3FNRFplN0VRLzJRajdTYldGNmNaNjZHMzJZQUVu?=
 =?utf-8?B?WW1IazFJWXU3dUxqcjlMOVdsdS9iWTR0ZWtmNnRiRlk0NUZyanBZcWhXWVpY?=
 =?utf-8?B?UHJWTWx0YVlLYVFRMWJxZUxiRVg3eVFlSlllazZkVVRpVkhLUEtuWFBRTk9y?=
 =?utf-8?B?SnErTjlmaWtCbWVORUttdVJ4N1g5VFZjN3YyS09zSXdETWtUQk1vbHhGQ3B6?=
 =?utf-8?B?L3c5RWNjYmVVR29CWWVVeklxNnNma3dONk5DRnE3MU5tUHBKZkJKbFRwNzJo?=
 =?utf-8?B?WGV3UlFjU2pISDlYTWQvZWVhZVNUMzh1SU8xc3B0RGMwK1hlRmtyVUVONWJV?=
 =?utf-8?B?U0tQeUhZc0lVeXgwWlNSRWZCOWl5Mk5DdjNsK2czZU1qQVZEZ2xaaWFlUXk5?=
 =?utf-8?B?MDY2WW5SMklQNzBGV1FKNUFaNENVOEV3VkNhZm56dGdQd3hyY1BlUHZBYTFY?=
 =?utf-8?B?MlR1ZzZIejZrZFZnK1VqZ2VqT0lMcXk1dHFmamhCdjdEdGVaQVZGdDRjUzlt?=
 =?utf-8?B?cXFudTRDVGN2NUc3Tk1KaklvbGpSVElkWHhlY3pZRnZ0aGNPeCtXN2YzeW1s?=
 =?utf-8?B?OHBYd25LL2JxeS9IekRtUi92Q0NDY2x4c2paOGdsY3dHdVcxc1lUeEg3UkhK?=
 =?utf-8?B?UC9uOEl0d1VlTVVEckNKRTN1QkJWbVF6U1dYZ084eHBGU3dhNnJZeGw3SXBI?=
 =?utf-8?B?dnRXRmFBNXJzZFNpYzFpQTU5QTZURmlXR0NLN0Y5MTRKa1VXR2xzYjdISEVj?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c45b7-5982-431f-9ee7-08dc1c4f3a62
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 20:09:38.8298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ix2Zmb2aNpGz5Asn156bqxXw9YgAYwXOlbGALu4Vp+VeYkyarIvgPEgOIz/76UqLFr1siW4g7PsvAqd+hrAj+BxaaerDuLfsDCfzg9xt0jM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5562
X-OriginatorOrg: intel.com

Daniel P. Berrangé wrote:
> On Tue, Jan 23, 2024 at 11:06:01AM -0800, Dan Williams wrote:
> > Nikolay Borisov wrote:
> > > 
> > > 
> > > On 23.01.24 г. 19:51 ч., Kuppuswamy Sathyanarayanan wrote:
> > > > 
> > > > On 1/23/24 8:07 AM, Nikolay Borisov wrote:
> > > >> When this driver got merged initially there was no widely agreed upon
> > > >> interface how the quote generation interface will work so having an
> > > >> ioctl made sense. However, there's now a vendor-neutral interface via
> > > >> configfs. Just remove the old ioctl interface and leave only the the
> > > >> configfs one.
> > > >>
> > > >> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > > >> ---
> > > > 
> > > > This ABI allows the user to get the raw report which is further used
> > > > for Quote generation via vsock. AFAIK, some vendors (TDX users) and
> > > > DCAP user libraries are still using this ABI to support attestation over
> > > > vsock model.
> > > > 
> > > > Don't you think we should wait till there are no users before considering
> > > > removing it?
> > > 
> > > Given that hw with TDX was just released I'd be surprised if there are 
> > > any users? But then again, this is an RFC so let's get opinions :)
> > > 
> > 
> > The assumption is that this tdx_guest_ioctl() ABI has never appeared in
> > an enterprise distro kernel. If that assumption is valid, it
> > significantly reduces the long term support exposure.
> 
> This ioctl is present in current RHEL-9 kernels
> 
>   https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob/main/drivers/virt/coco/tdx-guest/tdx-guest.c?ref_type=heads#L69
> 
> and this is exposed to users when running RHEL-9 guest on Azure
> cloud with TDX support.

Ah, ok, thanks for looking that up. Also good to see the new interface
is also backported into that kernel.

> I've not directly checked, but I would assume it is also probably
> included in Ubuntu LTS kernels too, since they also target TDX in
> Azure.
> 
> No idea what the status of SLES is wrt TDX / Azure offhand.

Seems like this needs to follow the typical upstream deprecation of
notifying in Kconfig and maybe a runtime message, and then circle back
in a couple years to remove when distros stop enabling the legacy
interface.
