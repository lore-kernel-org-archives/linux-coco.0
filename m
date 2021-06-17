Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A470
	for <linux-coco@lists.linux.dev>; Thu, 17 Jun 2021 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V9go7Y/UucnNrXIa1S8r+WI1e5UGRrj5UmJdJeNO/dA=; b=DH3TBb6PTIQLbsLVSV75pzrQdw
	YOvlaQGhwgDxkO+n6YHcCAQcekOch3TTkgmTSQyJSG+PTfbr9rhv8w+vKtjZcSboPUa0yed3OM6Xv
	O2jUrIlTuYUi1y9vgYNACiS7Lc+7ouOb55q+Nq6PJsitEvRbdvdo2XiQhbmMvNFacge2ptH3eu7lm
	kSPZJfLJpFpr7d6jZ/bbyyUf75MzrK66LY/+Mz9z5jfs6Fexynhfz7Qqc0uisvf4WVdV/gybL68W9
	5mQy5IpZrCBaK6A9Zus6JuMao0B8Fy0DFPW3ThfNH2q2ELD5/gn0XQHA7VNHkqqrlpUPYOsjOVAqp
	ixUOZqwg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttVj-009Fr5-UE; Thu, 17 Jun 2021 15:00:57 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 48ADC300252;
	Thu, 17 Jun 2021 17:00:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 31A2A2BD52F2F; Thu, 17 Jun 2021 17:00:48 +0200 (CEST)
Date: Thu, 17 Jun 2021 17:00:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
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
Message-ID: <YMtjoLLQpKyveVlS@hirez.programming.kicks-ass.net>
References: <20210616184913.13064-1-joro@8bytes.org>
 <20210616184913.13064-2-joro@8bytes.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616184913.13064-2-joro@8bytes.org>

On Wed, Jun 16, 2021 at 08:49:12PM +0200, Joerg Roedel wrote:

>  static void sev_es_ap_hlt_loop(void)
>  {
>  	struct ghcb_state state;
> +	unsigned long flags;
>  	struct ghcb *ghcb;
>  
> -	ghcb = sev_es_get_ghcb(&state);
> +	local_irq_save(flags);
> +
> +	ghcb = __sev_get_ghcb(&state);
>  
>  	while (true) {
>  		vc_ghcb_invalidate(ghcb);
> @@ -692,7 +704,9 @@ static void sev_es_ap_hlt_loop(void)
>  			break;
>  	}
>  
> -	sev_es_put_ghcb(&state);
> +	__sev_put_ghcb(&state);
> +
> +	local_irq_restore(flags);
>  }

I think this is broken, at this point RCU is quite dead on this CPU and
local_irq_save/restore include tracing and all sorts.

Also, shouldn't IRQs already be disabled by the time we get here?
