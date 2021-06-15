Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F92FB2
	for <linux-coco@lists.linux.dev>; Tue, 15 Jun 2021 09:37:47 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id C8B851EE; Tue, 15 Jun 2021 11:37:45 +0200 (CEST)
Date: Tue, 15 Jun 2021 11:37:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, Joerg Roedel <jroedel@suse.de>, hpa@zytor.com,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Slaby <jslaby@suse.cz>,
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
Subject: Re: [PATCH v5 2/6] x86/sev-es: Make sure IRQs are disabled while
 GHCB is active
Message-ID: <YMh06KmGITjU4eAf@8bytes.org>
References: <20210614135327.9921-1-joro@8bytes.org>
 <20210614135327.9921-3-joro@8bytes.org>
 <YMeC7vJxm0OVJJhr@zn.tnic>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMeC7vJxm0OVJJhr@zn.tnic>

On Mon, Jun 14, 2021 at 06:25:18PM +0200, Borislav Petkov wrote:
> Thoughts?

Okay, I tested a bit with this, it mostly works fine.

The lockdep_hardirqs_disabled() check in __sev_get/put_ghcb() was
problematic, because these functions are called also when no state is
set up yet. More specifically it is called from __sev_es_nmi_complete(),
which is called at the very beginning of do_nmi(), before the NMI
handler entered NMI mode. So this triggered a warning in the NMI
test-suite when booting up, I replaced these checks with a
WARN_ON(!irqs_disabled()) and also removed the BUG_ON()s.

With that it boots fine and without SEV-ES related warnings.

Regards,

	Joerg
