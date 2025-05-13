Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91B2BEC3E
	for <linux-coco@lists.linux.dev>; Tue, 13 May 2025 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161494; cv=fail; b=p2mODQHrORC3nx56NFrMuj58JxeyfyKlmkSLVw1hQBuH+DUSnQRgw2iyYz7o3pcwrB8X+yaeyWwwpb05avJ1fR+rh4b9CBMxKgp7Qho552ZC0l8OoV6wNkGFEn0R1K8jL3cowsaQ9WkfS0GXSVDZUxnJPAaQ5Z7LJ5xEPIijXAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161494; c=relaxed/simple;
	bh=Gh7IHc6aYzDvNXevtedIfx+QGAtpZx8cXUGd9Iwojco=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m8WpebSjdxQ7AsSuAbj3FB6BIsgE+nH3Cw2gb7pO3avmLygYhYVfRmTzy1VH7yBkrOnYndQtN5LCiMaxong4hzyX7SeKinHk6Rfe/MYPwKHBYd9exkUDWvH0UEXtttvclKHItVV2gGj5o/5riweV4//6Y/mYLBH2+kIoX2Nlrag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kC2xJCP3; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kC2xJCP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747161493; x=1778697493;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Gh7IHc6aYzDvNXevtedIfx+QGAtpZx8cXUGd9Iwojco=;
  b=kC2xJCP3bCvzaZAAqQg+dWMT0TmvDtb0FN8jQdsPnQR10KV2sHOhIY6u
   tD/bPfI3SD2hOpDZb1qRouxKbPjxsW+aYoIzQ1a6VzJrlvy7MjdQT+uyp
   jQBspSEYbVCPtbSNqyA4mZ/fV3UGamfd+8Ie/xncNTM8VwHRKul5bSKnP
   /I89H92gP9oE9GpgjsDyw94vR0gV54Pyt7/AdFy8G98Vk4zXHi3SRQRgU
   Uwquj55LOIQuY3scDjLyDgn1I23tgPj0KKfg0HtF1tk8flLWOWYlfNjED
   VfaEgpOsm3erQLJ9cW/MxxVy17QXLNPFGNuEzWG12PDXXhTZnlG7Q3UL/
   g==;
X-CSE-ConnectionGUID: Cu31eKFmTcWDkW53g9Id4A==
X-CSE-MsgGUID: WKJ85z8gSSGyngRmB/H1Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="74423850"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="74423850"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:38:13 -0700
X-CSE-ConnectionGUID: D/UmEuuDQySO0+ihPt8ZkQ==
X-CSE-MsgGUID: qmHv9wR4Tqi+9xCSXDBcAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137522597"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:38:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 11:38:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 11:38:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 11:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgY0AZEfxYL8WPjC9a/Y8ozRKQove0lNtmevSFWh2ehzwtZjlrOZjCKVHgLQZlwkG0BkRAcZXLNMUcEigGjEaGz6UcoAC2A2BbPszrVVFHdWm6GFo3ODsl6vQXu2TF3/0XY91rEHN4aEi7yB7Ai3+Bh7qajwXxEHdt3gntT6GlV03kNGOsVoQ0njsJ5P5BWP6Uvd4Z24jCc6kqBsqT4Vb5+50RCjzHR3nXQvjw4H2VlCLNV+6u4+UuR0RWij93DgQeFmcvR8cLrGu4luHADoHZYguFNL/RtvctFYo7Db88A2DRpdKuiWNzFAj1hfqsMwZPfMH4oqzeL3wCWjtD/MTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvXa1hC+zKKUAqZtv4yjqSE+ef7GWS0qF29crHHAmq4=;
 b=pgZsmyZLArUY7kAb5YpO9st6Sktv//wpLZrT1spPRZbuhPIkCSQhQe6xRigmbEJavMDsLsBVKHA/z47QcDb1jAbgGrNRifagmLUH3jP7Crzs0RJSWWPHgTiqHA4yGlkA+XXngITVwL3zZv+xNsz0WB+Xd1fVxqazOkLpJoKACfpbG9ljuDQVIt6ZZ/iH7852rmRy591LuGa3GB4/RISuKq/Fg2E6ZfNPkHC/nn0W7fzqSCiQEj3ThshsEmhfN5R88fkmAaQQh9bqfI1ZFwNhCAWI1hgtIsVfD2POCp/s8eT/+rzsJdjt/P0KS9KFW7y03Pco3jUSdsvtXNZUfRFSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 13 May
 2025 18:38:08 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 18:38:08 +0000
Date: Tue, 13 May 2025 11:38:07 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, <dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH] sample/tsm-mr: Fix missing static for sample_report
Message-ID: <6823918ef30b6_29032946e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250509030350.22363-1-cedric.xing@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509030350.22363-1-cedric.xing@intel.com>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dcd284-d2fe-410f-34f6-08dd924d4e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pHhfzyfE+jm3UcP20YRt1v5qu5hJ2BbWzjheHLoAzQPY3llAdbDaYRO1BQpw?=
 =?us-ascii?Q?uKLhsvwmLNdxef3QnGsQbGc3AQWKHGjiZYyfxN2DEl9rrA0TbF8QAW23u+u+?=
 =?us-ascii?Q?5cQaFsLPaWjRL00LHq73LfHanvQEEJdbiNhQn7vGZ0bLLg/DF+VpHIsLsUQz?=
 =?us-ascii?Q?0Pt7OOjDe7Sk9hMFJEMw9d9T86jAbPFlw5dS63VqsR+5PipUaxBwwNg/TMgJ?=
 =?us-ascii?Q?J7VSfHCVTDL59/3XIqx0QSTbxQpiC8WGpqiGxjf9EzfooFaND04OX/spucj6?=
 =?us-ascii?Q?uayl6mjDFMBzdWwBqvHxdfVAFYVPGwZH3sya9jYR7vyw4ERbnBGKseYi0dsA?=
 =?us-ascii?Q?ODdRp5avuvE7OjdGC5TAzUj7q660jwMiRnuQe2C/Uzg/EbSkYB4Y/sOiNFyp?=
 =?us-ascii?Q?MMW7Fg35CX7yaQ1h/qz7ItG9SEjbduBvZ5l62RxPGWXTinJU+wcO0ddcxFYb?=
 =?us-ascii?Q?DS75RCjAteEzvV45D49TlMRaiHfWwneScTXy3+R/vllANU2NDAMhHJpyMWrP?=
 =?us-ascii?Q?4AiCrKTAjyJgmOBRNeirDi/A0RYPgv6zsjYmz4Kzb5Pi1ApPOKzk+tfOsAYi?=
 =?us-ascii?Q?BVkS4MOBwfFzKfN3z8ZqB3WWkLSTL/eXTn8nO3YbtOzixTPZcrOJadUFUQ4I?=
 =?us-ascii?Q?G07x/g9SXbc0Neb8h6OdO583TtRyq29F5QCtc9lc6P5apEb3I6cPCUDPfOZn?=
 =?us-ascii?Q?rTZPEBGWaNNgW8Fvh3LTOZlXEkJNK/FE4LVvl6BFcHjJxA3pbFp5O66voMGk?=
 =?us-ascii?Q?ri8Bf+j/yqgtDfbA2YbOA6xmGCQFHka8EGELOgkhiK7WM6ZVtI7sZDy1rT5Q?=
 =?us-ascii?Q?tQUIo86Vt7MgllssvmRbVEVoa/40exdOxXxoET4C/Ma/wAROvSFAq6AwNxuX?=
 =?us-ascii?Q?FG65OC0RvxP0ry1rLeM6TLVaL7kDI+w8R7321sghq77HoVMeNd5WTli3eEK/?=
 =?us-ascii?Q?J2NW74KL7gLXxgsRaTvqklfHQUaz/VmX1+9Z6u1cK0X9Yru5Qaa/bxTHKlNd?=
 =?us-ascii?Q?74o0tTK3/QrOVC/LinLtaYivK+LtLU2wgnAtrxULgpehBfegTbFymhgn1Lub?=
 =?us-ascii?Q?/xl0cbAb+HByeowQ6GgO0hp2PFWWtezJltpYSy/gRu8XE3xIxVG+NKfV+wVq?=
 =?us-ascii?Q?6tBF71KJwY4F5sRzkWzQJ6+unNXnh6jDZJpbnT5qtuZezadPMSPZFhi+L7pk?=
 =?us-ascii?Q?5AYlYM22pEf0trVgf5IocLmseY3okakpDatvJ86FOMcAQcmlDasLxRvm1rlZ?=
 =?us-ascii?Q?YaP2MOTsxxQjCdqRFoC/o/TRuUty8dOYyq12OY3hiOmOs7zN4wXAr8QBDMcY?=
 =?us-ascii?Q?GzI3Mk5rkpph+002qr63yH7dHq4UGl0VzKb8clYRu4GSQR2h1eSy+YoaUF+c?=
 =?us-ascii?Q?j5qMgF4fz7b5HSj7FnGlr/J/xj/8528FNnRGJQLfFhn/jk83FjXxUbqfmqn4?=
 =?us-ascii?Q?dMXV0td8a/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yiVcSml30k7FvHZXot/yux6Whawf0L3xlK62cdgRB4mF8u64i6mNIYxdXwdi?=
 =?us-ascii?Q?NJfUvL2qz3o+FeWLgvvoYul4OeL37Idzao08gy6/dW+qiTxGIs6JZX4Q/Hek?=
 =?us-ascii?Q?26sVTQ6VwJAMGsbcz5iK8onXg45UlQHQd01KrPLwSqsM66le848ij1GMGGlh?=
 =?us-ascii?Q?EDG1wK469PDvlbBznh2AX1UH/KV9VQv1gn9E/M7cFf0OSzmtUOOQE1Z5ZENN?=
 =?us-ascii?Q?QaQQuJv7lU1y+5YdLa6UVFLh45P37zN6AuCe/ngZi1UHBCyx5KO1FgFGWxgN?=
 =?us-ascii?Q?W93nD8MuMmq5r16DDMHAyvlUHqsIH3uwuAiJk1Ta77l9UK/9VuWeVreL4zKb?=
 =?us-ascii?Q?DIo1VOwnIzdpPoahYRG91fr/e5PXuIuXHydUCr/dmG+tSnijFG/O/U1pg8lT?=
 =?us-ascii?Q?3SOGbunjbYx4FYArdj2k43Ovde6euSWE5PjyQBBTTi23hANC+WX/KzthyCJQ?=
 =?us-ascii?Q?Nkpb2zIpWZl3QxdwlXPffHYAmAGnvFlu6eJDRKdfiVqZSfZzOlBVXoHREoXJ?=
 =?us-ascii?Q?tHeCm3TvqZv+wH191NC8a0c5nJJE+wr0YZMhpV4NB6+1h20eTajepYAD+QsS?=
 =?us-ascii?Q?6vTmYp5HTuF0nRomTcBJgrASbaU8jAhay2w9aVipI/ysMulEMTHXwp8Ecbb+?=
 =?us-ascii?Q?ejugnf9dVgBkxXaAuL0X/nkImz3y2EczklBzB2EjbCbk5r224Y34k1T6K7wC?=
 =?us-ascii?Q?k5JVQdk4CnX46Uys9HI2VedBbBn1OxNNvJ9jVvfUoCi0dIJvUW2AV7JWk/K6?=
 =?us-ascii?Q?7VH6ip+p2+pnAmclENSXkaXpGUka0pDlwQH9DQuX5TkMpFfmgkFMAjJAPuEC?=
 =?us-ascii?Q?y8OgV6czgBpAZedpmHlcNxolXjL++Dv63hwHSk6q+xINo7nxPnJqS+n71E5A?=
 =?us-ascii?Q?jvMlzpEJOP7AEHiQz1W0fRiHn65vL4LNWPkZRbQztX0R7Vkp6uCxWk8vfaxU?=
 =?us-ascii?Q?ZA6VWHMRRh7sOt7X75T/nzTYNCd9athDO9XHDsvKaBnBBleRllzrbN00pkRR?=
 =?us-ascii?Q?WG2ReXmJkbm0OtjDey9M6fNLgGdyCjp85SJqNPC3s7aX3ZBvFb2QV6h4Wtwh?=
 =?us-ascii?Q?uybEflC6YEGniQIJjlsFDiKmQBzEHDvwYOX4pTFsNLvG1lGIfWhVR7zMeoxD?=
 =?us-ascii?Q?qnAk9gEU2a9CzjXHkxENjMaphmq4X9YZO03L4CSijAPQq0mK7MsPPISOWv1O?=
 =?us-ascii?Q?xMyioOdYY1JDAtectoR3cL9LNG4SyjD61Awy8kiUqpQL93TY9O3lckWhvFxY?=
 =?us-ascii?Q?ajEFjoMQLrviHULBUkexaqZsyet1TZ6qMumAVm7+eNHP8s12+njk92dyNESx?=
 =?us-ascii?Q?J9lP16STMI9WWo4F1C7gxourgAdhR2kZseOF12hGx1EToy9EzWfCuQ7E1hS6?=
 =?us-ascii?Q?iEhO3190n3itKc2UQz2LfYEkCsjNHjVnjazLDdMtf3RXn+pq/XMKUDcxmmrW?=
 =?us-ascii?Q?IA6XjyRxrZIqO6R1KUs+jxEw+ZOoTTTKeNFqMHIV8QSTESf0rf5b8+kf8XnY?=
 =?us-ascii?Q?UHqfhFhpiGeSDhdPp20wSE0bVeHAd16aWsYObfI6/SKg/CIuA/Ynz0LA4X48?=
 =?us-ascii?Q?rgPeBTW/cuScGl45t9jdEvHn6/zkb3R4UyYof3h38TkqhQluHlrX3W3YKVUC?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dcd284-d2fe-410f-34f6-08dd924d4e93
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:38:08.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1GeD9/2tg6eElJKSjeCK8H/0G+wXEQmsEGxnpo1+zxqTpMfvbCQ52g9jX30Yk8p+XXqP0qmQjwuG2xUyTh7SjWmEpJiWbm/PR4qNBCiRbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> 0day robot reports 'sample_report' can be static, fix it up.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505090938.avfIhLsl-lkp@intel.com/
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>

Looks good, applied.
