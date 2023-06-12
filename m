Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0B20F9
	for <linux-coco@lists.linux.dev>; Mon, 12 Jun 2023 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686553673; x=1718089673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=22flWAwLQKUVCiLVo3wLZM/UdamCpYNSAYMlKHqR5Fo=;
  b=hRpuVtvXAh+r3AKe6Qh29BtBxrPIhxdgZcbSOHkWBQrH03394oI9zKXm
   2LwxBXH/2G6e320wArR2QdeBQt0oP10TjjFGyU015aOf8yDupbEBddAXT
   iJAgST/NdmaqkfuehT5zY1WuHO77s5Qu4+d6ixEouLrZovuuTrTZRhxRJ
   dCVv92xhX469lNDWWDGoMw5FNZuJGPBNhQ7+/Pv+J7R1qlbVkHGroveY1
   Mdgpx/qUDcBy9dPcSyAmMTlHVkQHZaRng1QPrv1awUXNfsJIyLEUwEO7q
   5gM2EXE3yLbLofrHpSTLmd5DCC1sSP5BRgvypAvO0othwefvYEOTmWAIE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="361326968"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="361326968"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 00:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="688510808"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="688510808"
Received: from smizr3x-mobl3.ger.corp.intel.com (HELO box.shutemov.name) ([10.249.43.127])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 00:07:42 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id EB5A510CC1C; Mon, 12 Jun 2023 10:07:39 +0300 (+03)
Date: Mon, 12 Jun 2023 10:07:39 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>, bp@alien8.de
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com,
	tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org, ashish.kalra@amd.com,
	nikunj.dadhania@amd.com, liam.merwick@oracle.com,
	zhi.a.wang@intel.com, kai.huang@intel.com, isaku.yamahata@intel.com
Subject: Re: [PATCH RFC v9 05/51] x86/coco: move CONFIG_HAS_CC_PLATFORM check
 down into coco/Makefile
Message-ID: <20230612070739.w4myumbiomlpynuj@box.shutemov.name>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-6-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612042559.375660-6-michael.roth@amd.com>

On Sun, Jun 11, 2023 at 11:25:13PM -0500, Michael Roth wrote:
> Currently CONFIG_HAS_CC_PLATFORM is a prereq for building anything in
> arch/x86/coco, but that is generally only applicable for guest support.
> 
> For SEV-SNP, helpers related purely to host support will also live in
> arch/x86/coco. To allow for CoCo-related host support code in
> arch/x86/coco, move that check down into the Makefile and check for it
> specifically when needed.

Hm. TDX host support uses arch/x86/virt/vmx/tdx/. I think we need to be
consistent here.

IIRC, Borislav proposed the scheme that TDX uses.


-- 
  Kiryl Shutsemau / Kirill A. Shutemov
