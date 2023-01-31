Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7393808
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675155010; x=1706691010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hg7/0LlrdjEumbZbWuJrsEZn1KCy4Wb23vEnayL/tG0=;
  b=bNmPH7e9J/AQkvI1MB5GMDp3xhY3rk9pV52itqdy/LzPyQRcXxkByP6j
   fQgFQzE69D/x1df3tAdvvCn7qPBakFjk/pL0UgE8LzGAlQjkSwnP66oID
   R34DGhzZCCeAl4glcxPnsudgnPuC6ZRk1curOQ1kKqBvXktFYRejkVyNT
   2thiGhf2H/zMbPcmdfcPQS7COhl4U8W5CVZJWdHujcgsfFtqTLk+zBY+p
   YL8+m6eivhVCaUwIo3UzdksWDKqCx9nxdBGBiemRgR8Enxqliz/depEYg
   dBrKBH9atIwYOd6bxH/BIJQrgO+Nph9UqmNQT8H2eOVN8PY0mIN4VkH6X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311409694"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="311409694"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 00:50:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="772873843"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="772873843"
Received: from dianaman-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.33.19])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 00:50:06 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 374B610DF86; Tue, 31 Jan 2023 11:50:04 +0300 (+03)
Date: Tue, 31 Jan 2023 11:50:04 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] x86/tdx: Do not corrupt frame-pointer in
 __tdx_hypercall()
Message-ID: <20230131085004.dsaoazhathhl2ztt@box.shutemov.name>
References: <20230130135354.27674-1-kirill.shutemov@linux.intel.com>
 <Y9jSJUwNlXSpV3uM@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9jSJUwNlXSpV3uM@hirez.programming.kicks-ass.net>

On Tue, Jan 31, 2023 at 09:32:37AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 30, 2023 at 04:53:54PM +0300, Kirill A. Shutemov wrote:
> > If compiled with CONFIG_FRAME_POINTER=y, objtool in not happy that

Oops, just noticed a typo. s/in/is/

> > __tdx_hypercall() messes up RBP.
> > 
> >   objtool: __tdx_hypercall+0x7f: return with modified stack frame
> > 
> > Rework the function to store TDX_HCALL_ flags on stack instead of RBP.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Fixes: c30c4b2555ba ("x86/tdx: Refactor __tdx_hypercall() to allow pass down more arguments")
> > Link: https://lore.kernel.org/all/202301290255.buUBs99R-lkp@intel.com
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > ---
> > 
> > The patch is against tip/x86/tdx. tip/sched/core removes
> > TDX_HCALL_ISSUE_STI. The trird hunk of the patch is not relevant
> > after that.
> 
> Right, this should work. But it does leave me wondering, should we
> perhaps strive to completely remove the flags thing and move to
> __tdx_hypercall() and __tdx_hypercall_ret() or something? That is,
> simply have two different functions, one with and one without return
> data.
> 
> It should be trivial to generate that without actual code duplication.

Yeah, that's doable. I will give it a try. I guess on top this one (plus
sched/core changes) should be.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
