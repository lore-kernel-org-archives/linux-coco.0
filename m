Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E8A291C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 15:12:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id t25so4985535lfg.7
        for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x8Jy0OJ39PBOXthgIfAdqP1jgQfbb438h2GvJW/Mdq0=;
        b=mVTuWLuN8XZpFMJ+S+7U0qjJl+qK5dJblLURULdgRe/zT3wWoBwZfRqWcI9kIGhQix
         nJ0AlpkWAXgQzKGyiv+kR+rVuzVz+DEiOKI+39aGe1PTUDQ8PQmnF7lzUOTyeVqe+jYj
         /sPnpedyt4AqMb/Oe/lOmeQR9MXlebXyA5UNaCTZQAkhpYwhIjp+b0opRH/UNwzNPtdQ
         Kk22/0JzzDkTIXbMGifjZwkz6D6F0dqP5YXT6OK/4HiWJaQ2EEPlJAoKT7iFqZHu+CO3
         yCdSI3Vrj02rJYLXVd24AKX1AmjoKBptyIgnOqn/2cJdm0bxgeklwSTdhUM5wS9vLoIB
         buLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8Jy0OJ39PBOXthgIfAdqP1jgQfbb438h2GvJW/Mdq0=;
        b=oh8pjs5eEMs1AqINZmH8orG6fELa85fUkyr6GMsnnsNPTy+6kJOZ3uTgyALUOHOPXM
         gXHKhiK3Htr/V4XhpoJMRtMR5sB5MOBRU/K+Y62+4AkxujtFmvjkWuGhsh+S+jvNViVu
         yWVJ6RNjyIXjpgq8oLnLvA9KWMzNYuXr1Cm+ZuWl2hMYW0nF6uh61IPdO5zhIj1k/kwf
         HFD1K8HscgZhMcKoMO5mUHyWNhOMLceufj3x+P7MuEv7tHwWmDPUqVQ85IuPf00/ZxtS
         JY18n2ele7vb6AP8yeCR0ePt4M8HN1YhzknoMWZQK6znfPJuhLim4Xq1tluEbX4oqzjO
         gZ4g==
X-Gm-Message-State: AJIora9QZG0ZYSKk5COMg0RfyLBLgyfQPLWTAChl3yXldupz8rpyPWHu
	qAKZlm0Fyu7/+ZNaB0zBewD/uGSGxgP0x6YDi9snpA==
X-Google-Smtp-Source: AGRyM1ux6fJI1UqfhbKtYI3380oq0Yc9WPcnS1B8UQFcR4k15s9NIrtzUEPIL6muaukL0Y7LrG0POm9dBMYr5wpMzHA=
X-Received: by 2002:a05:6512:401a:b0:47f:6ea5:dace with SMTP id
 br26-20020a056512401a00b0047f6ea5dacemr9014219lfb.402.1656083551555; Fri, 24
 Jun 2022 08:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <7845d453af6344d0b156493eb4555399aad78615.1655761627.git.ashish.kalra@amd.com>
In-Reply-To: <7845d453af6344d0b156493eb4555399aad78615.1655761627.git.ashish.kalra@amd.com>
From: Peter Gonda <pgonda@google.com>
Date: Fri, 24 Jun 2022 09:12:20 -0600
Message-ID: <CAMkAt6oGzqoMxN5ws9QZ9P1q5Rah92bb4V2KSYBgi0guMGUKAQ@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 35/49] KVM: SVM: Remove the long-lived GHCB host map
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	"Lendacky, Thomas" <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, Marc Orr <marcorr@google.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alper Gun <alpergun@google.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 5:11 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> On VMGEXIT, sev_handle_vmgexit() creates a host mapping for the GHCB GPA,
> and unmaps it just before VM-entry. This long-lived GHCB map is used by
> the VMGEXIT handler through accessors such as ghcb_{set_get}_xxx().
>
> A long-lived GHCB map can cause issue when SEV-SNP is enabled. When
> SEV-SNP is enabled the mapped GPA needs to be protected against a page
> state change.
>
> To eliminate the long-lived GHCB mapping, update the GHCB sync operations
> to explicitly map the GHCB before access and unmap it after access is
> complete. This requires that the setting of the GHCBs sw_exit_info_{1,2}
> fields be done during sev_es_sync_to_ghcb(), so create two new fields in
> the vcpu_svm struct to hold these values when required to be set outside
> of the GHCB mapping.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 131 ++++++++++++++++++++++++++---------------
>  arch/x86/kvm/svm/svm.c |  12 ++--
>  arch/x86/kvm/svm/svm.h |  24 +++++++-
>  3 files changed, 111 insertions(+), 56 deletions(-)
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 01ea257e17d6..c70f3f7e06a8 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2823,15 +2823,40 @@ void sev_free_vcpu(struct kvm_vcpu *vcpu)
>         kvfree(svm->sev_es.ghcb_sa);
>  }
>
> +static inline int svm_map_ghcb(struct vcpu_svm *svm, struct kvm_host_map *map)
> +{
> +       struct vmcb_control_area *control = &svm->vmcb->control;
> +       u64 gfn = gpa_to_gfn(control->ghcb_gpa);
> +
> +       if (kvm_vcpu_map(&svm->vcpu, gfn, map)) {
> +               /* Unable to map GHCB from guest */
> +               pr_err("error mapping GHCB GFN [%#llx] from guest\n", gfn);
> +               return -EFAULT;
> +       }
> +
> +       return 0;
> +}

There is a perf cost to this suggestion but it might make accessing
the GHCB safer for KVM. Have you thought about just using
kvm_read_guest() or copy_from_user() to fully copy out the GCHB into a
KVM owned buffer, then copying it back before the VMRUN. That way the
KVM doesn't need to guard against page_state_changes on the GHCBs,
that could be a perf improvement in a follow up.

Since we cannot unmap GHCBs I don't think UPM will help here so we
probably want to make these patches safe against malicious guests
making GHCBs private. But maybe UPM does help?
