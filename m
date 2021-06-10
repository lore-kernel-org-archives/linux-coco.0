Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8456670
	for <linux-coco@lists.linux.dev>; Thu, 10 Jun 2021 11:30:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 87206329; Thu, 10 Jun 2021 13:30:28 +0200 (CEST)
Date: Thu, 10 Jun 2021 13:30:27 +0200
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
Subject: Re: [PATCH v4 3/6] x86/sev-es: Split up runtime #VC handler for
 correct state tracking
Message-ID: <YMH30/wFyE1JkKZg@8bytes.org>
References: <20210610091141.30322-1-joro@8bytes.org>
 <20210610091141.30322-4-joro@8bytes.org>
 <YMHnP1qgvznyYazv@hirez.programming.kicks-ass.net>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMHnP1qgvznyYazv@hirez.programming.kicks-ass.net>

Hi Peter,

On Thu, Jun 10, 2021 at 12:19:43PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 10, 2021 at 11:11:38AM +0200, Joerg Roedel wrote:
> 
> > +static void vc_handle_from_kernel(struct pt_regs *regs, unsigned long error_code)
> 
> static noinstr ...

Right, I forgot that, will update the patch and add the correct noinstr
annotations.

> > +	if (user_mode(regs))
> > +		vc_handle_from_user(regs, error_code);
> > +	else
> > +		vc_handle_from_kernel(regs, error_code);
> >  }
> 
> #DB and MCE use idtentry_mce_db and split out in asm. When I look at
> idtentry_vc, it appears to me that VC_SAFE_STACK already implies
> from-user, or am I reading that wrong?

VC_SAFE_STACK does not imply from-user. It means that the #VC handler
asm code was able to switch away from the IST stack to either the
task-stack (if from-user or syscall gap) or to the previous kernel
stack. There is a check in vc_switch_off_ist() that shows which stacks
are considered safe.

If it can not switch to a safe stack the VC entry code switches to the
fall-back stack and a special handler function is called, which for now
just panics the system.

> How about you don't do that and have exc_ call your new from_kernel
> function, then we know that safe_stack_ is always from-user. Then also
> maybe do:
> 
> 	s/VS_SAFE_STACK/VC_USER/
> 	s/safe_stack_/noist_/
> 
> to match all the others (#DB/MCE).

So #VC is different from #DB and #MCE in that it switches stacks even
when coming from kernel mode, so that the #VC handler can be nested.
What I can do is to call the from_user function directly from asm in
the .Lfrom_user_mode_switch_stack path. That will avoid having another
from_user check in C code.

> DEFINE_IDTENTRY_VC(exc_vc)
> {
> 	if (unlikely(on_vc_fallback_stack(regs))) {
> 		instrumentation_begin();
> 		panic("boohooo\n");
> 		instrumentation_end();

The on_vc_fallback_stack() path is for now only calling panic(), because
it can't be hit when the hypervisor is behaving correctly. In the future
it is not clear yet if that path needs to be extended for SNP page
validation exceptions, which can basically happen anywhere.

The implementation of SNP should make sure that all memory touched
during entry (while on unsafe stacks) is always validated, but not sure
yet if that holds when live-migration of SNP guests is added to the
picture.

There is the possibility that this doesn't fit in the above branch, but
it can also be moved to a separate function if needed.

> 	}
> 
> 	vc_from_kernel();
> }
> 
> DEFINE_IDTENTRY_VC_USER(exc_vc)
> {
> 	vc_from_user();
> }
> 
> Which is, I'm thinking, much simpler, no?

Okay, I am going to try this out. Thanks for your feedback.

Regards,

	Joerg
