Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92397582BB5
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194532; cv=pass; b=L/ZEDUFCqKqAAU5+hwYpmCJpJ5LFhtvvz253Ll7EmO7H1iWOyMu33v/deL3UepzR3JcUdGPLKPByTX9AemdFxppRnx415zdtaKQPwvagfqUiJAmxxB8TYcCCHqj6LjnPLr774RHOxlxHlqSmfiWiZQHPc356jEKs4EdOW4jsn3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194532; c=relaxed/simple;
	bh=AG+velq+P1x1sJHq2Eyj+yYuHBfJGE1bCcGBCBjr5A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BA0FfkLBhPH65Ua2WXcbO2LM4vb7vT+/tVNw2lpPpmBfs76L/o5Tvak9KFfBb8H0UfMo65tW9C9DqvcDH5F+pnoitFTaLkEAK+ogksh4UaWgz3oQdiMFVArFrXMfmccSSRoKkmTiEsv4v9lKtyOAHHx3eIPTkR/hXy5yhKpFklU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WR1CJfYG; arc=pass smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WR1CJfYG"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso1109043f8f.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 13:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194526; cv=none;
        d=google.com; s=arc-20260327;
        b=c+MNm5uxRMrLamYB273bK6RZXecUG3W7KpsyjuoL4s7h2yJt5qqrhmh4bz2C9dnUr8
         VcDiuzh/Tbby7WkTskxUiDUhZIGEvjS0bweuj3ggFg1hCS/zPUxiNGcT0qWVQQTWZTHq
         vIk6vgOsjUmzVBOqPR/vuyv3h6pCVuQl2IUpTQFJewm9A4grIsiZWdHVifMd9+jJtg39
         ZL2DO/neu2W2X3YjAhMAufCp/l6iXRB8yFQKm2k4Xl+imXDYllE425qiIlIVVNusJcc/
         PtrQmC+2yyHxGitM2WT8uQQxyF3Fy0ds33iqBFw8CLVy3Bw7dodgXnOkvPeM6+1XKDZ2
         sSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        fh=DrmC1ptPW1mzmrmK+9NbKbCuLWlwsJgwJ14gpHaCyUQ=;
        b=mkd0D7l/5/xNOq0JddelXBCgiEAkmYV47Fb9kcRwRmVl2tT1cN9wIUi6hFIrAb5eyx
         GvC9unArr7qAaqINmvonERrrBG+DXpeIpp9WDZF5aYqE8GuKaeUQ4f6FsOSebLHXNWpg
         ZjVARwQl6J0skhXw+mT0s/KjG5qSDEJaFj84kypqEat7UensFqWxHuuNrtXpaBPalpbs
         byVEQIp9H/ARhFBqIUjAbwJyVfKYUypreb6CpgMMO2gBlJlfb01uX++bnTE2pEkJYNHs
         55PU1EQ5RkXYAnOicGV+eh2MWHHtjed2D5KqD4QV43lj1cxim9toYKDvfIORUFLLnBBh
         Dy6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790194526; x=1790799326; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=WR1CJfYGluYZ4Ozv2fHOuIYTmIvZUTW1dySz8G735AU4jnDTcY6UPGK5ptsQ11t5Jh
         19I1Mr3JTlWjkvYmrNgfeCPl8Kyqq48gqtOLr0Lgf2TICzE7DiHfknGfUdMEwKkoOMsK
         jPTxyEDot/A0seqH878x6CgEhd9ltD5ta1Y0PDelxk1wra6P92LHdAW3MBpyDGv+d9y3
         E8p1Q+hqM7vMqbsjz+/kK5WqVU7ps4M6UlAm0D/JB3QsHYi1tR1mVU8a2xek15D/BH0S
         3UGL03aMinEpPUm0QRWt3kQOowrloL+mBXAArKxucNR1G8dKkV+JeCbxx/n26srPjlv/
         X7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194526; x=1790799326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=0m73ww+2xumjs/B5NzYEJE2TJ2fOhnnPWNON4zkEovnbQBhjfHvq0NCvE1APSDjcJU
         tUY9SbieLIxBqgTVZDDI9IzKnkIN7ihCu8xqXywRTWxYMd4VaxwybXRsrTpm7sYs68LS
         fR9kOOBh/ArttvBqlhz8claVGP5WnAxHpj+Ch5ZkB9KfEUqRiU8HW5MsuuByWD3J0Emw
         GF0pwyvUmTV4HVQ3pYB4m7i8p9iQuEPOsxdJsQ6pAk0sg7edxBeZCSKrjp9MTSsBoMnk
         rUpBrzk08fItWOdf5B3oi1YI49dJaT5w5JgznD99NtrH7xjF4mx7rY/KNAQKT9ieGBQi
         J9oA==
X-Forwarded-Encrypted: i=1; AKwUvBwhdsgOH93ZwFLMeG54NWgd6WMSBuErHgslXPEzH+nY8wx1PtgPKl/Xf95acmngmnnvxkdClO3AjJZY@lists.linux.dev
X-Gm-Message-State: AFuF++npUCAjWgo2te78llTqUF01izdujGb21cFZrTHHRS0c1Tnru8iV
	HWkNAMEMT6/V6sYXRvmGIsAVUXOe/z6QVlapYhFdInAqMe2wuK7rOwtd0GOKLDOePeUtt0CSkfT
	1MOhZTefg6PL3Us+lRNQero6eiHpwoRS9b1ADdqXp
X-Gm-Gg: AYBFou3rhyJmUeIOvE8d16BbraPntxwaKhuWiJ6i/wI4Y86YjkrruqZIXbT0QstrpRv
	vti63FlgEhKPtqzm5yLAEjFO6V89zbXt9lxyCG4C1sMpj4kBASU4DcFGLPweJpIKYa+XD34uTr1
	YCjwOYy8MmLj3LCv0CFOJ4Tr+MF9eftV/x3WyM2yPl+oODb9lWWq6m9JVrVgNypCcXA7hlzLwVK
	MMXBMTQF4cZnCzXefaJlk5ZSc2nfCTTydkB77l4MXuzDyS1GynTOMkk6t6Ii5pPn+YFaOuxrxDi
	BjPeiUSMG9C+koUCBl6XzrCROT8aMlF8hWfq3uQC1SJOqyJiVUuHqKkKopooHcEZ9Y1oKFUqU6c
	pUi6XBYPPvT9xCFX0WbYU6ITBlVjjMscaVESDU/dNukRYqZBZKUA+78Yu5kCsWdXUTrEO0eG1if
	gK9w==
X-Received: by 2002:a05:6000:2383:b0:485:ad55:208d with SMTP id
 ffacd0b85a97d-488716c8d48mr511088f8f.18.1790194525443; Wed, 23 Sep 2026
 13:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260911084211.3149957-1-jgross@suse.com> <20260923193619.1408940-1-shreshth.srivastava@intel.com>
In-Reply-To: <20260923193619.1408940-1-shreshth.srivastava@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 23 Sep 2026 13:15:14 -0700
X-Gm-Features: AclHuK-BmScte-vitIZ7FKAidjIiegIYr2tRDSSJKsz3-ZO8Fal-vgtzUYiiixY
Message-ID: <CAKwvOdnKS+E9R3QaFk98dPNNh7uW=8yuJpYWGPHbY7k40Fk=rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
To: Shreshth Srivastava <shreshth.srivastava@intel.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, llvm@lists.linux.dev, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	xin@zytor.com, nathan@kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:36=E2=80=AFPM Shreshth Srivastava
<shreshth.srivastava@intel.com> wrote:
>
> On 11.09.26 10:41, Juergen Gross wrote:
> > When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> > infrastructure will always use functions for reading or writing MSRs,
> > even when running on bare metal.
>
> Hi Juergen,
>
> This doesn't build with CONFIG_PARAVIRT_XXL=3Dy. 16/17 and 17/17 are wher=
e
> it breaks, but the cause is the .byte fallbacks: ASM_WRMSRNS_IMM from
> 08/17 and ASM_RDMSR_IMM from 10/17 don't end in a separator, unlike the
> .insn variants above them.
>
>   #define ASM_RDMSR_IMM                         \
>         " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
>
> That worked while they were only ever the last argument of an
> ALTERNATIVE(), which appends its own newline. 16/17 concatenates them
> with ASM_CLRERR:
>
>         ASM_RDMSR_IMM ASM_CLRERR, X86_FEATURE_MSR_IMM,  \
>
> so the .long operand runs into the xor. From
> make arch/x86/kernel/cpu/common.s:
>
>         .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long 266xor %rdx,%rdx
>
>   paravirt-msr.h:165: Error: junk at end of line, first unrecognized char=
acter is `x'
>
> clang reports "error: unexpected token" in the same place. 71 objects
> fail, the same 71 either way, no vmlinux.
>
> msr.h chooses between the .insn form and the .byte fallback with:
>
>         #if defined(CONFIG_AS_IS_GNU) && CONFIG_AS_VERSION >=3D 24100
>
> Two kinds of toolchain end up on the .byte side of that test:
>
>   - GNU as older than 2.41. RHEL 9 and CentOS Stream 9 ship 2.35, and
>     Documentation/process/changes.rst sets the minimum at 2.30, so this
>     is a supported configuration rather than an old outlier.
>   - clang, any version. CONFIG_AS_IS_GNU is never set for clang, so the
>     && short-circuits and the version comparison is never reached. Your
>     08/17 comment already notes that clang has no .insn support.

Indeed, looks like we're missing support for .insn for x86.
Filed https://github.com/llvm/llvm-project/issues/225916.
(Please do file bugs against the toolchain when you encounter issues
like this, and cc someone from kernel development).

>
> gcc with binutils 2.41 or newer takes the .insn path, where both macros
> do end in a separator, and is unaffected.
>
> Reproduced on v7.3-rc2 with your v3 00/13, v2 0/5 and v5 00/17 applied in
> that order, x86_64 defconfig plus HYPERVISOR_GUEST, PARAVIRT, XEN and
> XEN_PV. gcc 11.5.0 with GNU as 2.35.2, and clang 21.1.7.
>
> Terminating both fallbacks fixes it, and both toolchains then build
> vmlinux with no errors or warnings:
>
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index eba325ecfe4c..529c13553c63 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -78,9 +78,9 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int=
 failed) {}
>   * form MSR access instructions reference %rax as the register operand.
>   */
>  #define ASM_RDMSR_IMM                          \
> -       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]\n\t"
>  #define ASM_WRMSRNS_IMM                                \
> -       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]\n\t"
>  #endif
>
>  #define RDMSR_AND_SAVE_RESULT                  \
>
> ASM_WRMSRNS needs no change, _ASM_BYTES() already emits a semicolon.
>
> The WRMSRNS line belongs in 08/17 and the RDMSR line in 10/17.
>
> Thanks,
> Shreshth



--=20
Thanks,
~Nick Desaulniers
