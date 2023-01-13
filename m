Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636892F2A
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 15:49:04 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so932859pjg.4
        for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 07:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wobIjMJNqTwtr3bYoELqDsKPAwD1PC9Q+itWmni1C6o=;
        b=b63RB6SUcCzsN6y8LRPVghJm6iLrFxEo37MywBuf7UMlj+FVwXhZZe4YLNQobeby9f
         5Y7aa0MQGskyI2wvFHZz+jDqS363pC0Dz1i7oI/i6JDA6Xndz8H2Uyj6ctnHzV51E6/E
         w792bLZupviwtara97i1v6aHHvJ6p1tQzOr0T7doUpDitcCzKuM5r010rVTnPFIm3Bog
         RLbnXBcBp5mJBlujcwZJ1eZjCw7yBPrDxzjHsG8vRZXjN1VQLLh9sN8DhDoY0Ki7pAkB
         2wQNZMUUctFpcWq/t8PpsJAki9xOcJ8zX1OD7H8Ltkbbcch0m4LNTv2NTDyZ6IZqe46O
         RhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wobIjMJNqTwtr3bYoELqDsKPAwD1PC9Q+itWmni1C6o=;
        b=W5QuOr3K3eH8eLmotUNrEbWDrnB1UeLaN3cMzwdrbt3ZKYaLkcM5+M2D2FyFMnw79f
         yDcwzQnFNd2WXxRZMtS6VBhSDDOphIti2xh7k3kvPTYsAFeRmgpgQQ9dHKnEUOvbxSR/
         aNFlHzSrlAVxHDGkPUr8JZeJYmNMGWOSq4vz3YZoe44N7f1uw3CbW0egmW/rLPYFMCJ3
         Wl9KGglsUSMYuCqrF5IQo09h17OzZs62Daw8pb7afuS+CCR/Huh/gLl/dYM+oeGoHn0s
         hqpqFTeJsCxAAFHJh+Ds8yBCq+GgD7cI0p7/iysc/scz67sCR+1S++NySO46qfli3rFc
         W5Yg==
X-Gm-Message-State: AFqh2kqi4Zt8FhZj0BA01CQI9PgKWF1TOi/nNVlBOX6V2Wq28/49rFqK
	lcixrA7GZOP59/yhBmrwp4I5nw==
X-Google-Smtp-Source: AMrXdXsEAKrdgDrfSletqAhmR5qRLbIJ5zZEClWrVw8g6qy+aLPjc/GLLtqeuK1KgkeyLfP8BgaTBA==
X-Received: by 2002:a17:90a:fd12:b0:226:5758:a57f with SMTP id cv18-20020a17090afd1200b002265758a57fmr1478484pjb.2.1673624943743;
        Fri, 13 Jan 2023 07:49:03 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id nv7-20020a17090b1b4700b00212cf2fe8c3sm2732462pjb.1.2023.01.13.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 07:49:03 -0800 (PST)
Date: Fri, 13 Jan 2023 15:48:59 +0000
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, vkuznets@redhat.com,
	wanpengli@tencent.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com,
	tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org, ashish.kalra@amd.com,
	harald@profian.com
Subject: Re: [PATCH RFC v7 04/64] KVM: x86: Add 'fault_is_private' x86 op
Message-ID: <Y8F9a2pmh13aIQZL@google.com>
References: <20221214194056.161492-1-michael.roth@amd.com>
 <20221214194056.161492-5-michael.roth@amd.com>
 <Y628y6hQK38+IAev@zn.tnic>
 <20230105024256.ptujtjgzcdmpakoa@amd.com>
 <Y8Fr/F1RV0B8CHq5@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8Fr/F1RV0B8CHq5@zn.tnic>

On Fri, Jan 13, 2023, Borislav Petkov wrote:
> On Wed, Jan 04, 2023 at 08:42:56PM -0600, Michael Roth wrote:
> > Obviously I need to add some proper documentation for this, but a 1
> > return basically means 'private_fault' pass-by-ref arg has been set
> > with the appropriate value, whereas 0 means "there's no platform-specific
> > handling for this, so if you have some generic way to determine this
> > then use that instead".
> 
> Still binary, tho, and can be bool, right?
> 
> I.e., you can just as well do:
> 
>         if (static_call(kvm_x86_fault_is_private)(kvm, gpa, err, &private_fault))
>                 goto out;
> 
> at the call site.

Ya.  Don't spend too much time trying to make this look super pretty though, there
are subtle bugs inherited from the base UPM series that need to be sorted out and
will impact this code.  E.g. invoking kvm_mem_is_private() outside of the protection
of mmu_invalidate_seq means changes to the attributes may not be reflected in the
page tables.

I'm also hoping we can avoid a callback entirely, though that may prove to be
more pain than gain.  I'm poking at the UPM and testing series right now, will
circle back to this and TDX in a few weeks to see if there's a sane way to communicate
shared vs. private without having to resort to a callback, and without having
races between page faults, KVM_SET_MEMORY_ATTRIBUTES, and KVM_SET_USER_MEMORY_REGION2.

> > This is mainly to handle CONFIG_HAVE_KVM_PRIVATE_MEM_TESTING, which
> > just parrots whatever kvm_mem_is_private() returns to support running
> > KVM selftests without needed hardware/platform support. If we don't
> > take care to skip this check where the above fault_is_private() hook
> > returns 1, then it ends up breaking SNP in cases where the kernel has
> > been compiled with CONFIG_HAVE_KVM_PRIVATE_MEM_TESTING, since SNP
> > relies on the page fault flags to make this determination, not
> > kvm_mem_is_private(), which normally only tracks the memory attributes
> > set by userspace via KVM_SET_MEMORY_ATTRIBUTES ioctl.
> 
> Some of that explanation belongs into the commit message, which is a bit
> lacking...

I'll circle back to this too when I give this series (and TDX) a proper look,
there's got too be a better way to handle this.
