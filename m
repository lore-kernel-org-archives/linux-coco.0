Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7D4C75
	for <linux-coco@lists.linux.dev>; Wed, 23 Aug 2023 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692789111; x=1724325111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7lhvv0m0FRAc3xPq+YaVEQaHYC8M/wOu6WhO33cafNU=;
  b=njRLEqfnqqqpaIOfz0P6sMbKp5pQAw5Wjtj2HqG9RxXYBDafngdoaAeW
   mlPztfiaf5ASVwY4a6L6aAHlM62Nyb4N6AHWKGi6+6FcoiL9yLTeZNzCE
   370JRuau+v5sX2QeaEKEEuODTNrol+iRowGG+kdnhUCRQn7cQ+I9o55M7
   q7PaoghHN1VizuUzUObzg2QEsw9zm/sIezf+Fttvd5Igh28EMkdF6uPBA
   UpszpJc20886tWI4Z8xlLwI6cGu95qhtKPQxum/WxWS8INGJ9UM0Bh+sU
   cczKqNvm79H9ElUzM+fQrYrR6bbXew16F+hPzF6ClmUnEnSltlB9/GCQr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359118825"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359118825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 04:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="1067450061"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="1067450061"
Received: from bachaue1-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.212.119])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 04:11:47 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id DAA021098A2; Wed, 23 Aug 2023 14:11:44 +0300 (+03)
Date: Wed, 23 Aug 2023 14:11:44 +0300
From: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"Lutomirski, Andy" <luto@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCHv2] x86/tdx: Mark TSC reliable
Message-ID: <20230823111144.x7g3cvbxjenldnih@box.shutemov.name>
References: <20230822231823.3205-1-kirill.shutemov@linux.intel.com>
 <f5dc2de9d3997c3a89bdedee6cb0bf554f400ccc.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5dc2de9d3997c3a89bdedee6cb0bf554f400ccc.camel@intel.com>

On Wed, Aug 23, 2023 at 04:47:29AM +0000, Huang, Kai wrote:
> On Wed, 2023-08-23 at 02:18 +0300, Kirill A. Shutemov wrote:
> > In x86 virtualization environments, including TDX, RDTSC instruction is
> > handled without causing a VM exit, resulting in minimal overhead and
> > jitters. On the other hand, other clock sources (such as HPET, ACPI
> > timer, APIC, etc.) necessitate VM exits to implement, resulting in more
> > fluctuating measurements compared to TSC. Thus, those clock sources are
> > not effective for calibrating TSC.
> > 
> > In TD guests, TSC is virtualized by the TDX module, which ensures:
> > 
> >   - Virtual TSC values are consistent among all the TD’s VCPUs;
> >   - Monotonously incrementing for any single VCPU;
> 
> Nit:
> 
>     - Virtual TSC is monotonously incrementing ...
> 
> Otherwise here "incrementing" looks like a noun, which means you need to use
> "monotonous" rather than "monotonously".

Okay, will update.

> >   - The frequency is determined by TD configuration. The host TSC is
> >     invariant on platforms where TDX is available.
> > 
> > Reliable TSC is architectural guarantee for the TDX platform and it must
> > work for any sane TDX implementation.
> > 
> > Use TSC as the only reliable clock source in TD guests, bypassing
> > unstable calibration.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 
> Acked-by: Kai Huang <kai.huang@intel.com>

Thanks.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
