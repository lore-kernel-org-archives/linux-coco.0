Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427F0808
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675154353; x=1706690353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RCAx/SVdwzpoxtG6dsVhEuTiwPDXXArst9gLzvIUq5g=;
  b=TJo0rCmI2VOTlh3ljA3x6GCtdNUvez+DV3n5GTWCrCAL684lsXcfj4Mi
   1ncJIG8KbDURI3A9OdfGHxV0k9By/8OlnwucAlAdp2THEeGlivbPlZNvR
   PZrP6NcHG2sbSOwg+/XFcfC8PM11OejNGCQawwdicLIusld7dIv+a8O6s
   E7Fx4Wt1xVCt9AQURxm7Gx2G7MGMsLWo/44YpyudjIo3h7dVG3NbwBe8D
   OSF0w1/Ec/rbpLHmhIcpEU4o/mMmddmljWKRLQM6a6PpxcQDmScu38ZyK
   3LMpc5bWuXyFMeehagRnF5XzKH2J1KkmR2E8BIo1UgWMdHbRKyVoz45ZW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="414002125"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="414002125"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 00:39:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664420245"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664420245"
Received: from dianaman-mobl1.ger.corp.intel.com (HELO box.shutemov.name) ([10.252.33.19])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 00:39:04 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 090D610DF86; Tue, 31 Jan 2023 11:39:02 +0300 (+03)
Date: Tue, 31 Jan 2023 11:39:01 +0300
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
Message-ID: <20230131083901.ssg5huno2lhrbmzg@box.shutemov.name>
References: <20230130135354.27674-1-kirill.shutemov@linux.intel.com>
 <Y9jShNfS/d8LGu8w@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9jShNfS/d8LGu8w@hirez.programming.kicks-ass.net>

On Tue, Jan 31, 2023 at 09:34:12AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 30, 2023 at 04:53:54PM +0300, Kirill A. Shutemov wrote:
> > If compiled with CONFIG_FRAME_POINTER=y, objtool in not happy that
> > __tdx_hypercall() messes up RBP.
> > 
> >   objtool: __tdx_hypercall+0x7f: return with modified stack frame
> > 
> > Rework the function to store TDX_HCALL_ flags on stack instead of RBP.
> 
> Also, on IRC you mentioned that per TDX spec, BP is a valid argument
> register too and you were going to raise this and get it fixed, TDX
> hypercalls must not use BP to pass data.

I've raised the question yesterday. No progress so far. It will take time
to get it into the public spec.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
