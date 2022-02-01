Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552D2F24
	for <linux-coco@lists.linux.dev>; Tue,  1 Feb 2022 20:22:01 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id t14so25744664ljh.8
        for <linux-coco@lists.linux.dev>; Tue, 01 Feb 2022 12:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G0oCZMu217/ki1S16h4/FaCOqstgzPK5PitKLqVB4GI=;
        b=qCbRjXCBmrWXNO40eBUCVKSHZY+HsAYvBvpVOHOelK6aqTwpbJWQLNElJ/jF533g3o
         jmH8456QEdbZboMX0AaDls/S0xM44tK4l9H1JEhL/B+r4PMul0ow7OIszwCgXbyykpUc
         3dYXDeWFJ1JIyxJij/ftOIqTdSUTlH2unh10wi3tauPNTwsMmYh/A7to3iLZWP73/epC
         xFSEqG5gFzZuYOF32fyHlgRNfNiSOyXwKEj0793+vWzTl9QNUBk4g6NW2/gOohd9JJUI
         g8CxDVAjiHZzAdVvM7wVOLcxin58bnJ82BrBuldQIs0zrJ6g+/yr+HMBiMo9fc0MrkYx
         WKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G0oCZMu217/ki1S16h4/FaCOqstgzPK5PitKLqVB4GI=;
        b=EhQiOIdk5mZYmwMzLi1fONEtfWmVTSxWE/7qyDfXQDXgIRUtG2Nw/8dxjnoEvVhsNY
         4SPutV+k6GRANl+pQu+wrrCfloGZIm8XGTLhU7DbAPBU66lg09r56AiHBTxxp8OXCd+8
         W6qcLTxQemklRjnUgPLKWjv1mGIp8ewFjIslg5oPb7oAy8wrm3KdtgpK+Kcrq695RRfr
         rT0TvSugO+XIDglXBvkjx6WQ+/jzr9MWSfEMzuixZ45ewtEblrit+7j0/Cwgr9dtFHZu
         zBEis5nfmGb50cDfgrVEjxDYtA7ahzwo91hEXdizNcO2GZaNNxA7djQ+CKpr3eWoCq1q
         857Q==
X-Gm-Message-State: AOAM531AIwKD4FBkaP+djQxeGLPuRhfpW+JLjb/J2BjLEu5Vh3iCoYxg
	HkKGsD4fYK3sXDAHtwjEe0W1paoWqGy9ZSLM4qBwWg==
X-Google-Smtp-Source: ABdhPJxViziF/mIbCEXRWkWFi0lsbcqCh9RniknQHSnF1iFdRY2ZEW83U4dSdJf2AwwGRFeeH0sukrADhPIhUKwO21U=
X-Received: by 2002:a2e:a781:: with SMTP id c1mr16377411ljf.527.1643746919071;
 Tue, 01 Feb 2022 12:21:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220128171804.569796-1-brijesh.singh@amd.com> <20220128171804.569796-41-brijesh.singh@amd.com>
In-Reply-To: <20220128171804.569796-41-brijesh.singh@amd.com>
From: Peter Gonda <pgonda@google.com>
Date: Tue, 1 Feb 2022 13:21:47 -0700
Message-ID: <CAMkAt6rfTbQB8kZp1Nkh7GpEsWXETAPNoEOhqiMx7o68ZHgjww@mail.gmail.com>
Subject: Re: [PATCH v9 40/43] x86/sev: Register SEV-SNP guest request platform device
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, brijesh.ksingh@gmail.com, 
	Tony Luck <tony.luck@intel.com>, Marc Orr <marcorr@google.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 10:19 AM Brijesh Singh <brijesh.singh@amd.com> wrot=
e:
>
> Version 2 of GHCB specification provides Non Automatic Exit (NAE) that ca=
n
> be used by the SEV-SNP guest to communicate with the PSP without risk fro=
m
> a malicious hypervisor who wishes to read, alter, drop or replay the
> messages sent.
>
> SNP_LAUNCH_UPDATE can insert two special pages into the guest=E2=80=99s m=
emory:
> the secrets page and the CPUID page. The PSP firmware populate the conten=
ts
> of the secrets page. The secrets page contains encryption keys used by th=
e
> guest to interact with the firmware. Because the secrets page is encrypte=
d
> with the guest=E2=80=99s memory encryption key, the hypervisor cannot rea=
d the
> keys. See SEV-SNP firmware spec for further details on the secrets page
> format.
>
> Create a platform device that the SEV-SNP guest driver can bind to get th=
e
> platform resources such as encryption key and message id to use to
> communicate with the PSP. The SEV-SNP guest driver provides a userspace
> interface to get the attestation report, key derivation, extended
> attestation report etc.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/include/asm/sev.h |  4 +++
>  arch/x86/kernel/sev.c      | 61 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 9830ee1d6ef0..ca977493eb72 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -95,6 +95,10 @@ struct snp_req_data {
>         unsigned int data_npages;
>  };
>
> +struct snp_guest_platform_data {
> +       u64 secrets_gpa;
> +};
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  extern struct static_key_false sev_es_enable_key;
>  extern void __sev_es_ist_enter(struct pt_regs *regs);
> diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
> index 1d3ac83226fc..1e56ab00d1f4 100644
> --- a/arch/x86/kernel/sev.c
> +++ b/arch/x86/kernel/sev.c
> @@ -19,6 +19,9 @@
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/cpumask.h>
> +#include <linux/efi.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
>
>  #include <asm/cpu_entry_area.h>
>  #include <asm/stacktrace.h>
> @@ -34,6 +37,7 @@
>  #include <asm/cpu.h>
>  #include <asm/apic.h>
>  #include <asm/cpuid.h>
> +#include <asm/setup.h>
>
>  #define DR7_RESET_VALUE        0x400
>
> @@ -2177,3 +2181,60 @@ int snp_issue_guest_request(u64 exit_code, struct =
snp_req_data *input, unsigned
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(snp_issue_guest_request);
> +
> +static struct platform_device guest_req_device =3D {
> +       .name           =3D "snp-guest",
> +       .id             =3D -1,
> +};
> +
> +static u64 get_secrets_page(void)
> +{
> +       u64 pa_data =3D boot_params.cc_blob_address;
> +       struct cc_blob_sev_info info;
> +       void *map;
> +
> +       /*
> +        * The CC blob contains the address of the secrets page, check if=
 the
> +        * blob is present.
> +        */
> +       if (!pa_data)
> +               return 0;
> +
> +       map =3D early_memremap(pa_data, sizeof(info));
> +       memcpy(&info, map, sizeof(info));
> +       early_memunmap(map, sizeof(info));
> +
> +       /* smoke-test the secrets page passed */
> +       if (!info.secrets_phys || info.secrets_len !=3D PAGE_SIZE)
> +               return 0;

This seems like an error condition worth noting. If no cc_blob_address
is passed it makes sense not to log but what if the address passed
fails this smoke test, why not log?

> +
> +       return info.secrets_phys;
> +}
> +
> +static int __init init_snp_platform_device(void)
> +{
> +       struct snp_guest_platform_data data;
> +       u64 gpa;
> +
> +       if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
> +               return -ENODEV;
> +
> +       gpa =3D get_secrets_page();
> +       if (!gpa)
> +               return -ENODEV;
> +
> +       data.secrets_gpa =3D gpa;
> +       if (platform_device_add_data(&guest_req_device, &data, sizeof(dat=
a)))
> +               goto e_fail;
> +
> +       if (platform_device_register(&guest_req_device))
> +               goto e_fail;
> +
> +       pr_info("SNP guest platform device initialized.\n");
> +       return 0;
> +
> +e_fail:
> +       pr_err("Failed to initialize SNP guest device\n");
> +       return -ENODEV;
> +}
> +device_initcall(init_snp_platform_device);
> --
> 2.25.1
>
