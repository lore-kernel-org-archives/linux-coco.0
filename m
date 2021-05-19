Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0A72
	for <linux-coco@lists.linux.dev>; Wed, 19 May 2021 13:16:41 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 63C252FA; Wed, 19 May 2021 15:16:39 +0200 (CEST)
Date: Wed, 19 May 2021 15:16:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <seanjc@google.com>
Cc: x86@kernel.org, Hyunwook Baek <baekhw@google.com>,
	Joerg Roedel <jroedel@suse.de>, stable@vger.kernel.org,
	hpa@zytor.com, Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Slaby <jslaby@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	David Rientjes <rientjes@google.com>, Cfir Cohen <cfir@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Stunes <mstunes@vmware.com>,
	Martin Radev <martin.b.radev@gmail.com>,
	Arvind Sankar <nivedita@alum.mit.edu>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 2/6] x86/sev-es: Forward page-faults which happen during
 emulation
Message-ID: <YKUPtrquQyImL3h5@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-3-joro@8bytes.org>
 <YJwQ1xsiDtv3LkBe@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJwQ1xsiDtv3LkBe@google.com>

Hi Sean,

On Wed, May 12, 2021 at 05:31:03PM +0000, Sean Christopherson wrote:
> This got me looking at the flows that "inject" #PF, and I'm pretty sure there
> are bugs in __vc_decode_user_insn() + insn_get_effective_ip().
> 
> Problem #1: __vc_decode_user_insn() assumes a #PF if insn_fetch_from_user_inatomic()
> fails, but the majority of failure cases in insn_get_seg_base() are #GPs, not #PF.
> 
> 	res = insn_fetch_from_user_inatomic(ctxt->regs, buffer);
> 	if (!res) {
> 		ctxt->fi.vector     = X86_TRAP_PF;
> 		ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
> 		ctxt->fi.cr2        = ctxt->regs->ip;
> 		return ES_EXCEPTION;
> 	}
> 
> Problem #2: Using '0' as an error code means a legitimate effective IP of '0'
> will be misinterpreted as a failure.  Practically speaking, I highly doubt anyone
> will ever actually run code at address 0, but it's technically possible.  The
> most robust approach would be to pass a pointer to @ip and return an actual error
> code.  Using a non-canonical magic value might also work, but that could run afoul
> of future shenanigans like LAM.
> 
> 	ip = insn_get_effective_ip(regs);
> 	if (!ip)
> 		return 0;

Your observations are all correct. I put some changes onto this
patch-set to fix these problems.

Regards,

	Joerg
