Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B835186E20
	for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412357; cv=none; b=FiIob94uYW/wtwl9LJgUnIaQXkGqtEQT1Ou2+ivc8B4rKHRnoHP2okcku0l6ZEBLr+p+inG7c5y104tCqbGE4ypL5zQ0FarzRBjXX3gmGwkSGim4pYQIWPjo+2ZUBWHOFWkoZE4xNzOsvwIxtnp1UTkWljw1uHMshWSGDDv3F7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412357; c=relaxed/simple;
	bh=ZNPzGDrViZtN+euOTYNGNCvhSBpNIjiT+sYwF77Gmis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lAi2glu0Ov+kEv8dFf9jzQU9oR83WDr07JU7MIBlZWitUrvXU7PoJjq88ICg8rZNDqooLkpdaYLcaglKGMCHiMbYAw7p3b4IBd0mW+VOU3CDFnJjE+o9GhNhf/DtRc0frVf4gmSuQbaVshz4H36CQuGLaL22K6YfhwCp2RFMst4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hy0kQ5gY; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hy0kQ5gY"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2c7c3401dfdso8589887a91.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Jun 2024 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719412354; x=1720017154; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ymlm/4AWkUfS196/Og/rjOQ+iw7EfhnrK5+wBxuoc0=;
        b=hy0kQ5gYrKfB1sT9ytT+XZIvW0XWpBjL+Gz0BObslKneqkDinO5+7rBBAdc1vouegT
         +SQLXUrWCRt6NNteGGeEKaSabQIbFU3sfwrRBSBPdWEYdKnVLJ1tXq/oLroq1MQWwITU
         c/8ywSk7ZfQBJNMUjQyoHnhqmrhq7hMe14s6Dr8No/vaVijg+AloAD5US9GL1rhyRTtW
         7ioiUI1X+OoAumdc9P8lPHi/wPGwRDYroyqg+PWy8f1HN9mKsvH0RvC89X8h1iztq2Gu
         pC/tgYwnQEZ5hHjADTUvuzJVdGZ5qtrdI+o0ofIGPGqZG8g9I46WNy+MnJKs1H/V2u2v
         pfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719412354; x=1720017154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Ymlm/4AWkUfS196/Og/rjOQ+iw7EfhnrK5+wBxuoc0=;
        b=pUzR+EBa7YBE0cK/eeLO6Ji4vHnc/VKKOfepbx18cYc3MEeNtY8RsuxFXQQ0yMjjjB
         KKoOcfxIgYrrloBu8MO4yyY8SgM9Z0j8avtks+oIGuwQ99A7tnh73IF9DlfB99Y2lzqG
         51tuveB2oD/uXX3MZTVKVhQtnoArR+MrH6ILkiThWZQ6uxX6jXVDcPo7pafputFIEMja
         RcP/FtXoBvC8ZKd5frHhTGebfoR+kwh/HFXRShD2QeQBLUxkqBURgW5wjPMa+UKGCCyY
         BjE9Jyp8T5D8hu46lgTSVTFzKfOyzeT8qEpULz8csWXhB/l6ZYF9Scq5TEnCGdG7mrGU
         Hlyg==
X-Forwarded-Encrypted: i=1; AJvYcCUAUASocdsImsC+9uHq9uRajDQfpDyvvUvu0TITDm+VxN7tTEVtGTvdWBsSfSWcS9312gJd8TJp4HbJDJ66tIy8nisdnGsFnclyIg==
X-Gm-Message-State: AOJu0Yzfm7UYSTglw05Iamq8K7kCyUlr3ivAgLlwig3xwXq+JD9+uNo3
	Ey57eFfWbBGsAmaUwWB69dDkYTH0XuZK8oQQaVUQSBIa2TuhGbKPxDJ3vWp+5jhROIyDiwp6z6x
	GOA==
X-Google-Smtp-Source: AGHT+IHoLpy1haJfmM+o0LmD5U1iZh86EBvuJ5rgP0o2pdMh09BBK9/6PtMelrlOW3VGdks0UySW+x/E2qQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:e7c4:b0:2c2:c6fa:c05d with SMTP id
 98e67ed59e1d1-2c86147a695mr30306a91.9.1719412353662; Wed, 26 Jun 2024
 07:32:33 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:32:32 -0700
In-Reply-To: <20240621171519.3180965-1-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240621134041.3170480-2-michael.roth@amd.com> <20240621171519.3180965-1-michael.roth@amd.com>
Message-ID: <ZnwmgHYWQQ4DP176@google.com>
Subject: Re: [PATCH v1-revised 1/5] KVM: SEV: Provide support for
 SNP_GUEST_REQUEST NAE event
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, pbonzini@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, pgonda@google.com, 
	ashish.kalra@amd.com, bp@alien8.de, pankaj.gupta@amd.com, 
	liam.merwick@oracle.com, Brijesh Singh <brijesh.singh@amd.com>, 
	Alexey Kardashevskiy <aik@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 21, 2024, Michael Roth wrote:
> diff --git a/include/uapi/linux/sev-guest.h b/include/uapi/linux/sev-guest.h
> index 154a87a1eca9..7bd78e258569 100644
> --- a/include/uapi/linux/sev-guest.h
> +++ b/include/uapi/linux/sev-guest.h
> @@ -89,8 +89,17 @@ struct snp_ext_report_req {
>  #define SNP_GUEST_FW_ERR_MASK		GENMASK_ULL(31, 0)
>  #define SNP_GUEST_VMM_ERR_SHIFT		32
>  #define SNP_GUEST_VMM_ERR(x)		(((u64)x) << SNP_GUEST_VMM_ERR_SHIFT)
> +#define SNP_GUEST_FW_ERR(x)		((x) & SNP_GUEST_FW_ERR_MASK)
> +#define SNP_GUEST_ERR(vmm_err, fw_err)	(SNP_GUEST_VMM_ERR(vmm_err) | \
> +					 SNP_GUEST_FW_ERR(fw_err))
>  
> +/*
> + * The GHCB spec only formally defines INVALID_LEN/BUSY VMM errors, but define
> + * a GENERIC error code such that it won't ever conflict with GHCB-defined
> + * errors if any get added in the future.
> + */
>  #define SNP_GUEST_VMM_ERR_INVALID_LEN	1
>  #define SNP_GUEST_VMM_ERR_BUSY		2
> +#define SNP_GUEST_VMM_ERR_GENERIC	BIT(31)

Related to my suggestion to not have KVM-defined error codes, if we go that route,
then I believe SNP_GUEST_VMM_ERR_GENERIC is unnecessary.

For snp_handle_guest_req(), if sev_issue_cmd() fails, KVM can/should do something
like:

	/* Forward non-firmware errors to userspace, e.g. if the PSP is dead. */
	if (ret && !fw_err)
		goto release_req;

	ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SNP_GUEST_ERR(0, fw_err));

And then in snp_complete_req_certs(), we could either let userspace shove in any
error code whatsoever, or restrict userspace to known, GHCB-defined error codes,
e.g.
	int err;

	err  = READ_ONCE(vcpu->run->coco.req_certs.ret);
	if (err)
		if (err != SNP_GUEST_VMM_ERR_INVALID_LEN &&
		    err != SNP_GUEST_VMM_ERR_BUSY)
			return -EINVAL;

		if (err == SNP_GUEST_VMM_ERR_INVALID_LEN)
			vcpu->arch.regs[VCPU_REGS_RBX] = vcpu->run->coco.req_certs.npages;

		ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, SNP_GUEST_ERR(err, 0));
		return 1;
	}


>  
>  #endif /* __UAPI_LINUX_SEV_GUEST_H_ */
> -- 
> 2.25.1
> 
