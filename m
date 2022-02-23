Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2FDA56
	for <linux-coco@lists.linux.dev>; Wed, 23 Feb 2022 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645619096; x=1677155096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zk0Q5i+bK10PCCeKqTaU8DiX28bSdfCtroqlbdMjIsw=;
  b=TiUs85wdylEUimzLe7337Z0ylY8Y0oqnulVKdgzABhk/jk/efpLVyMhw
   JOe44xOrMdxUWUp2oyDWNgg2Ww59Kz+yEGdk6TyOrb2GR/S16UiziyCvi
   iPlMjdEQz5weyDBv/iAKSHGpNIgRxQFq9/95GitAjvx2BhDNPTgANfgpf
   et4W2RvSN7oJM3sr8K0KLSwWuweOSDZSOO63djkLcJybe6M6gKMdkLoQZ
   XGY9tWBNpg5ekpd1MsAL/kIo2HMTKPsnVrnxvXsVKhNS2E0LQeWKhH/iu
   avjJ3obJpY+dGxmaGsP/TGM66X3WRnCzbth2l7phnALLZo83fpbJ7XjWj
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232571893"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="232571893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="781813629"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2022 04:24:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 1BB0B143; Wed, 23 Feb 2022 14:25:08 +0200 (EET)
Date: Wed, 23 Feb 2022 15:25:08 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	David Rientjes <rientjes@google.com>,
	Michael Roth <michael.roth@amd.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH] x86/mm/cpa: Generalize __set_memory_enc_pgtable()
Message-ID: <20220223122508.3nvvz4b7fj2fsr2a@black.fi.intel.com>
References: <20220222185740.26228-1-kirill.shutemov@linux.intel.com>
 <20220223043528.2093214-1-brijesh.singh@amd.com>
 <YhYbLDTFLIksB/qp@zn.tnic>
 <20220223115539.pqk7624xku2qwhlu@black.fi.intel.com>
 <YhYkz7wMON1o64Ba@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYkz7wMON1o64Ba@zn.tnic>

On Wed, Feb 23, 2022 at 01:13:03PM +0100, Borislav Petkov wrote:
> On Wed, Feb 23, 2022 at 02:55:39PM +0300, Kirill A. Shutemov wrote:
> > This operation can fail for TDX. We need to be able to return error code
> > here:
> > 	/* Notify hypervisor that we have successfully set/clr encryption attribute. */
> > 	if (!ret)
> > 		ret = x86_platform.guest.enc_status_change_finish(addr, numpages, enc);
> 
> bool to state failure/success or you need to return a specific value?

So far it is only success or failure. I used int and -EIO as failure.
bool is enough, but I don't see a reason not to use int.

-- 
 Kirill A. Shutemov
