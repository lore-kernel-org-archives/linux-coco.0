Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48516173
	for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 20:23:04 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id s18so11050552pgg.8
        for <linux-coco@lists.linux.dev>; Fri, 16 Jul 2021 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x85rFiYKbp37maDQJOeVsTrROe6NzpgrCb0rCmLZT5M=;
        b=A3iaz5afAQGHEMb5dAx2xN1+E/Jkl1exglVeIMNRgB04QPj2THSJNWjFHH4urOC4dj
         azzuyrfh/0lup7t52U45wwGHGx8zncavC+7HwrEL3oJwy/PeRI46jUEK0qujvYADefKM
         ArovxtIPS/UAgoxpNVVFKG1HXyvqmh/SOMk3r2oZmO0lj0BNXSOSYxiq86oLWGpzEqzx
         KFUbSDnqnzAODG1aEbYMh+kDC3D+M6SXrMy0/MM0ejw2dka6jMwj5/ZiAjC+QAPQ0dBB
         tZ2XeFnfbp2L4X1kFk+q9un5p8BAkl8dwzio2EB2PCFjXW8QMJqBrsIbUOddU2P4I+C3
         O5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x85rFiYKbp37maDQJOeVsTrROe6NzpgrCb0rCmLZT5M=;
        b=SdFSQfkveliG6Mt6llPafY5JnYdI/1Jd3QICmddyWYFQ9K7bkfueZNEjWxREau+ds7
         pNu2zPYXRI30E4MTAWbD3wkL2WufuDzRcTH01W9oHPIUQUtfLEy+WgVLrgRcfUhmbGCA
         XYFLEhyMvUQmuxF+bLgCHAvq7CcpbOLpZkewF7qKgKq12JCxeKtGif3cWYU1QoOrSjeB
         +2upLONZevnD/7WPNE++m3L7budIsA8pSWUqjJgOQ9IrbT/LbteOrg0bvSLj+EybjUa/
         Gkq7UAYT5D/MiGvj+IJ3tvBxC/bhmd7QWSNM0lsYBCftTmzW6IDWDF93YXAJooSD93eI
         R+TA==
X-Gm-Message-State: AOAM533EVHR4dN9K+XAhOdKehwYopKTCVzOo7KZVBe/uaiPj3rA9uKn4
	8YMAAoldGa230Zo3FO7xQXJyPQ==
X-Google-Smtp-Source: ABdhPJxWNEVP2UwoOT65EqEX3Q4hJT3FKuvSXbD5nsfxrItaCDkJFf10AIQZc6tNG7uEGWx3oLscpg==
X-Received: by 2002:a63:1e59:: with SMTP id p25mr11432905pgm.110.1626466983659;
        Fri, 16 Jul 2021 13:23:03 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id o134sm11534516pfg.62.2021.07.16.13.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 13:23:03 -0700 (PDT)
Date: Fri, 16 Jul 2021 20:22:59 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Subject: Re: [PATCH Part2 RFC v4 30/40] KVM: X86: Define new RMP check
 related #NPF error bits
Message-ID: <YPHqo+KefHLrAclx@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-31-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707183616.5620-31-brijesh.singh@amd.com>

Nit, please use "KVM: x86:" for the shortlogs.  And ubernit, the "new" part is
redundant and/or misleading, e.g. implies that more error code bits are being
added to existing SNP/RMP checks.  E.g.

  KVM: x86: Define RMP page fault error code bits for #NPT

On Wed, Jul 07, 2021, Brijesh Singh wrote:
> When SEV-SNP is enabled globally, the hardware places restrictions on all
> memory accesses based on the RMP entry, whether the hyperviso or a VM,

Another typo.

> performs the accesses. When hardware encounters an RMP access violation
> during a guest access, it will cause a #VMEXIT(NPF).
