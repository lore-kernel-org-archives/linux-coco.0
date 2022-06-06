Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965B23CB
	for <linux-coco@lists.linux.dev>; Mon,  6 Jun 2022 11:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654515727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LbU0lHc+WuTsfhjoR9o0hk34WGqlmY1f4clG2HCMCgk=;
	b=GdNj97MlOG2A67jgibe+4hsKpOAHqDLNtwlv8f89XTvUMy7FELty6m42+Ym7NlPNYk1ftF
	wZuBPyISMIV7xl14tsoTbmeyiLX7MyZreko95BOwtqUJ9veUCFzfUNtNo4VWYfgsaCy1HK
	VwVPU0PiZkKgCAeginH8Y0s/lYp8hcg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-xqSN7ebuOh-1BqIdUxlIGA-1; Mon, 06 Jun 2022 07:42:06 -0400
X-MC-Unique: xqSN7ebuOh-1BqIdUxlIGA-1
Received: by mail-wm1-f70.google.com with SMTP id c125-20020a1c3583000000b003978decffedso11119508wma.5
        for <linux-coco@lists.linux.dev>; Mon, 06 Jun 2022 04:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LbU0lHc+WuTsfhjoR9o0hk34WGqlmY1f4clG2HCMCgk=;
        b=7hUmlvVVt5DjYUYNuSRQ7YnqUHu7u+osjwXSRBdpRnhFlE1dWfjZtHZkkfAhA2hjYB
         ehCtv0NFU4X2BImdjoKyqDP1oiKSfqCYMt1MSIBQ+xw/K4tI92AbbvLOoTbWFG6v21lj
         Xm6AqPyNiK1bB/iQjgpWyZWaatzWB2XlnB+sxjp9/7IAQ9NDXuO5wVlT+MDxmma+6See
         cDpOHSBe01xmg0TtJb5ay2ydSLn0y0bNIuKzXyBf7eWEp/VCjyLgySWyaM2a6fxLAzIs
         A/7gTdJaaJ/unKqjtFTduZgWwVdqbSqmZ9Kzy/XAUuAmTGkXjEePLGsvjfOMpo3c7Jwn
         oSUg==
X-Gm-Message-State: AOAM532bE0ghGpGXQji/VBmvvUbVWWeGHE29PfyACqo6oA4IAoHG52sP
	Z51sNpExXmvSQbWuzJxMAWGBcXxVos3/5JBdSxY+RQYIztQODerKuqcMaGeZPJYFQyUNWo5cyl3
	scGc0xPgbrsNMSM+7swNeSQ==
X-Received: by 2002:adf:f385:0:b0:213:bb0e:383a with SMTP id m5-20020adff385000000b00213bb0e383amr16114856wro.481.1654515725382;
        Mon, 06 Jun 2022 04:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEvzYVC9++mJVt13KuXQ5MBP3pxhBSkYiVChyG6utGpOcobdad2X2l/uq7b7FRSa2su3OnkA==
X-Received: by 2002:adf:f385:0:b0:213:bb0e:383a with SMTP id m5-20020adff385000000b00213bb0e383amr16114820wro.481.1654515725160;
        Mon, 06 Jun 2022 04:42:05 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d5045000000b0020d07d90b71sm14848968wrt.66.2022.06.06.04.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 04:42:04 -0700 (PDT)
Date: Mon, 6 Jun 2022 12:42:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part2 RFC v4 04/40] x86/sev: Add the host SEV-SNP
 initialization support
Message-ID: <Yp3oCYwZbYuVQ9r6@work-vm>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-5-brijesh.singh@amd.com>
 <YpijNgA9ZJFOwF8k@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YpijNgA9ZJFOwF8k@kernel.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jarkko Sakkinen (jarkko.sakkinen@iki.fi) wrote:
> On Wed, Jul 07, 2021 at 01:35:40PM -0500, Brijesh Singh wrote:
> > The memory integrity guarantees of SEV-SNP are enforced through a new
> > structure called the Reverse Map Table (RMP). The RMP is a single data
> > structure shared across the system that contains one entry for every 4K
> > page of DRAM that may be used by SEV-SNP VMs. The goal of RMP is to
> > track the owner of each page of memory. Pages of memory can be owned by
> > the hypervisor, owned by a specific VM or owned by the AMD-SP. See APM2
> > section 15.36.3 for more detail on RMP.
> > 
> > The RMP table is used to enforce access control to memory. The table itself
> > is not directly writable by the software. New CPU instructions (RMPUPDATE,
> > PVALIDATE, RMPADJUST) are used to manipulate the RMP entries.
> 
> What's the point of throwing out a set of opcodes, if there's
> no explanation what they do?

TBF They are described in the public document section linked in the previous
paragraph.

Dave
> BR, Jarkko
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

