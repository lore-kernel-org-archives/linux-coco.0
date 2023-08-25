Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B0F7495
	for <linux-coco@lists.linux.dev>; Fri, 25 Aug 2023 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692971552; x=1724507552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ff+tmKeviz7Kz9QLJ+KfEVtCTFCGM3JTe5HpM3V7Lts=;
  b=BiYaP46lhJLAEmQi3TWewhGVTZ5Ff/8bSgFrQfufSUQuov8UWDyqsA0j
   xs+B876jlrBuokn3Z9JxgHd8KQM5oJydlGW+n5A0LDOGvpc6M+4hH9Uxa
   Zyw7IPYd2FPwpRkq61V9QWYatb4y/ezQp6RPq6dcqixbzgU7C/pocpFSg
   2Ew0jS+Lts2byFK2gVreF2g9y5S3yyQPYtyfN1JpHe07h/z/z7kfXEzxV
   xYG7GHRd8Jl/6KzKYeYaAR+fn9YdMBgILrrImLeoePr8dlzEUxPHEVIjj
   qqXC5gIKycQgBNePe2TEfaYhkSg8Dq1cinijETHcJnerA8bMAMiPK8dmh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="355044970"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="355044970"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772480336"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="772480336"
Received: from naikshri-mobl7.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.41.113])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:52:28 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 16589109FED; Fri, 25 Aug 2023 16:52:26 +0300 (+03)
Date: Fri, 25 Aug 2023 16:52:26 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/tdx: Mark TSC reliable
Message-ID: <20230825135226.ikxvskplvppghwtz@box.shutemov.name>
References: <20230808162320.27297-1-kirill.shutemov@linux.intel.com>
 <ecc11d54-6aaa-f755-9436-ae15b94fb627@intel.com>
 <20230808200111.nz74tmschph435ri@box>
 <87bkewcufi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkewcufi.ffs@tglx>

On Thu, Aug 24, 2023 at 05:49:05PM +0200, Thomas Gleixner wrote:
> On Tue, Aug 08 2023 at 23:01, Kirill A. Shutemov wrote:
> > On Tue, Aug 08, 2023 at 10:13:05AM -0700, Dave Hansen wrote:
> >> I take it this is carved in stone in the TDX specs somewhere.  A
> >> reference would be nice.
> >
> > TDX Module 1.0 spec:
> >
> > 	5.3.5. Time Stamp Counter (TSC)
> >
> > 	TDX provides a trusted virtual TSC to the guest TDs. TSC value is
> > 	monotonously incrementing, starting from 0 on TD initialization by the
> > 	host VMM. The deviation between virtual TSC values read by each VCPU is
> > 	small.
> 
> Nice weasel wording. What's the definition of "small"?

The newer spec says "Virtual TSC values are consistent among all the TD’s
VCPUs at the level supported by the CPU".

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
