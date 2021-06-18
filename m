Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16E70
	for <linux-coco@lists.linux.dev>; Fri, 18 Jun 2021 08:18:04 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 639DC3A7; Fri, 18 Jun 2021 10:17:56 +0200 (CEST)
Date: Fri, 18 Jun 2021 10:17:54 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joerg Roedel <jroedel@suse.de>, hpa@zytor.com,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jiri Slaby <jslaby@suse.cz>,
	Dan Williams <dan.j.williams@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	David Rientjes <rientjes@google.com>, Cfir Cohen <cfir@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Stunes <mstunes@vmware.com>,
	Sean Christopherson <seanjc@google.com>,
	Martin Radev <martin.b.radev@gmail.com>,
	Arvind Sankar <nivedita@alum.mit.edu>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v6 1/2] x86/sev: Make sure IRQs are disabled while GHCB
 is active
Message-ID: <YMxWsjZcudaorPgV@8bytes.org>
References: <20210616184913.13064-1-joro@8bytes.org>
 <20210616184913.13064-2-joro@8bytes.org>
 <YMtshtgEbiQ993Zk@hirez.programming.kicks-ass.net>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMtshtgEbiQ993Zk@hirez.programming.kicks-ass.net>

On Thu, Jun 17, 2021 at 05:38:46PM +0200, Peter Zijlstra wrote:
> I'm getting (with all of v6.1 applied):
> 
> vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x1bf: call to panic() leaves .noinstr.text section
> 
> $ ./scripts/faddr2line defconfig-build/vmlinux __sev_es_nmi_complete+0x1bf
> __sev_es_nmi_complete+0x1bf/0x1d0:
> __sev_get_ghcb at arch/x86/kernel/sev.c:223
> (inlined by) __sev_es_nmi_complete at arch/x86/kernel/sev.c:519

I see where this is coming from, but can't create the same warning. I
did run 'objtool check -n vmlinux'. Is there more to do to get the full
check?

Regards,

	Joerg
