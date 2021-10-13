Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8B42C83
	for <linux-coco@lists.linux.dev>; Wed, 13 Oct 2021 21:20:15 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id g5so2708084plg.1
        for <linux-coco@lists.linux.dev>; Wed, 13 Oct 2021 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RGN5XybAu/ZhV4g4WKdQdjzcI3C7PMTK/Om4cnVrUpo=;
        b=URyt4OiWOZC9rK5oCCWsfUHOqUulNfj8PNGEdBZtuq6KCLHghJJH1K2XFPqHe+8A7y
         56MHd6S8jFcLp7x91lXskW43i/kaf10KdqkU+LjqEdBmY1cKnBADOUyg4E/e4bVlRSQp
         sXUn2UHFAJtGCxOdV+33RGRos4gvcpAsM+/EJTmf+5mshqUfa6AWpZCOYewLATdcJgXI
         TxHeqzIogq3Ec9tg0+7AUlZcDaZe7URCgnMuLvWHocz/izBx/kV3wTyYKYYLhxcPOZto
         2M98Jb9p2C4x5nYV+q1yvkyuEtlMcPzrwMzIvIq0Trd1MB/16Mx/Re0M5DPMChi+vAnM
         rtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RGN5XybAu/ZhV4g4WKdQdjzcI3C7PMTK/Om4cnVrUpo=;
        b=3vHhe8UWmI7h4vxKzlNvV11GFE4A6VFRSZcO7tEVWnh2Qi4Rj6ndk4uG1SyAtBE25k
         jZjMCJiCSF0j+MkZU3c2v82MfSuTyS4FW2B3chyiGaZsWcxSScR82RWfsv97RptXY7aR
         sNk9R+hs/XQZ/gCxuyN1RV0ZbDqR8B8fvUFpFoGUY1YG6QSgwYGs7I659JPWWbA5ai4n
         w0bgFl6ndbgJLP2s5SHfycGAtXM/CZJNl5O5ksJ8lsOXOOlY4t9g7bPhCctlcQZRMeMe
         ic8IHSuWJUSWw3tSkPibw2T3o4ZDZrdZKduo0/pTeoW3e4EWBY9ynLwP7Wxi5hi52uVW
         //ew==
X-Gm-Message-State: AOAM530Kj4lPa8hIt3VGF4/ltRIhY0Sy3PMaO0SFQ10wpDNqDLhjBimL
	CkA1Ef/18svXJYjW/nl1d6ONvg==
X-Google-Smtp-Source: ABdhPJychxbBPRopo44Q5l2xzCuClhpOoVGj+sul7kS1bgtgKxWbFsqery8BnwMw41xY+QTD3uOz7w==
X-Received: by 2002:a17:90b:30d6:: with SMTP id hi22mr16321219pjb.4.1634160014413;
        Wed, 13 Oct 2021 14:20:14 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id u12sm414951pgi.21.2021.10.13.14.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 14:20:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 21:20:10 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 34/45] KVM: SVM: Do not use long-lived GHCB map
 while setting scratch area
Message-ID: <YWdNisk78f5BVNv3@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <20210820155918.7518-35-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820155918.7518-35-brijesh.singh@amd.com>

On Fri, Aug 20, 2021, Brijesh Singh wrote:
> The setup_vmgexit_scratch() function may rely on a long-lived GHCB
> mapping if the GHCB shared buffer area was used for the scratch area.
> In preparation for eliminating the long-lived GHCB mapping, always
> allocate a buffer for the scratch area so it can be accessed without
> the GHCB mapping.

Would it make sense to post this patch and the next (Remove the long-lived GHCB
host map) in a separate mini-series?  It's needed for SNP, but AFAICT there's
nothing that depends on SNP.  Getting this merged ahead of time would reduce the
size of the SNP series by a smidge.
