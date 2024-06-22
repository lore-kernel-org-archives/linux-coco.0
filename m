Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14753E31
	for <linux-coco@lists.linux.dev>; Sat, 22 Jun 2024 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719088128; cv=none; b=D/CRy530Xo1KD4A6pWG3ub5BwyYEsNPfWIdlUKP0ARw0RYCY9SXBtRbCPzGIXgVJSIjUG6Wa1Ck8FLJmjJyZBKnngQOWNNqPgByTWoNz1CagukTFqCV10wPywXbLFUp1m6Dm9i9X/jjJIv3qPrHxtDyqIU/K1zeykyr18FKcL1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719088128; c=relaxed/simple;
	bh=3naxbCWYWyb12WIaRMFMGCevr88ZJi3vnfvM+hQe39k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZx16lfFPMJN9+nI2kTBTjrnsp9fE5RoKtK4bIQ+KHIvgaVRa84MP4fICdt+GIBww7xKNOzdT3/FFvrmQBWXKlR6QLwi6yu1cBpJ28GBbp3XDcP4v0Bpdytdh4b+ah/f4HVlhJoFZ2n3JVkV4n/lbWPa086JGLKtMv6GvpX5/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnfSdLin; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnfSdLin"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5c1cabcb0c1so1456587eaf.0
        for <linux-coco@lists.linux.dev>; Sat, 22 Jun 2024 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719088126; x=1719692926; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wz5Oa6/rWVrsFAb0cFynFRFfx1R/TSvc0ki+GhEz5L4=;
        b=fnfSdLinr2a6sMrRuci+uz7a5xIKKCGHwskPjRIQ9OWP7aZQ7/7pcXEuTE6SGzwSmd
         JczRv8tlnodn7uyLlNs1unQRbUFXz4htPKBmVaNgj/qHPKLNdBeRkL7N//HfXRiIMe+2
         1YE0TyrprmpUcQ4dEhXF3vxIFr2uoJJsCEdYSnLW01jyjBfNwisuUq5s6CUWQxVug8Xw
         3aT9SFOK6LLDI1PRfThkbv+aht1wLHTo/ljZpQr8HWsiXD1oqe7MrgdE1h022F3aDFao
         UPlg7UnynawIu3nXQoIBliICv5HnoLqugEhnfuyVUH+q4O+y9pJ31otzoUdz6Fd027Ui
         QAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719088126; x=1719692926;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz5Oa6/rWVrsFAb0cFynFRFfx1R/TSvc0ki+GhEz5L4=;
        b=j9LQ4QdPX1fLKPXxfOvOcOeqwf/h+vWmJOd4mLVgtQPipvpayLQz0xQymJhnOwEYrU
         hdtJMcJp+Qb22ZHlCBfpxhmgsnEY15LKbEpS5Q8pUQzIUkclLeAYKVh4q0jkO+WM8DEs
         J4yLo7mSbtkDw5FC9Lbke4yqmMHmWlPCBHpacjZwUK6rfftZEQf4s3LmKtNWX8aF5xmv
         nv7DaA9F7JelCGTwnuLqvXuHqa7ACUoTE7ll6jxYSVMmvV3f5omIHJ/gAKecYHegSlRk
         cGmY4i7grGnqfZh/NYRDV7glZAFl6+KyyRbEgBn391AOBYShrFQqy6zZ5fuLMhNrje9G
         z/Tg==
X-Gm-Message-State: AOJu0Yzw3Dltrfd0S97XUv940hDq9iA0XzzqUsgwhRXDhcMyiWbJR4BA
	+Bx2j66QbGv2mNbbP9ukXnAjd5ldNMEZTjP5EQeHPkomqueQjRAU
X-Google-Smtp-Source: AGHT+IE789iTevCzbZ7tRv7egdxCiedgWdhlftr81cGxwdKYHeUeTH4vqoVa4ggmavoKIxtlOnNaaw==
X-Received: by 2002:a4a:764b:0:b0:5ba:ffcb:c759 with SMTP id 006d021491bc7-5c1eed1072cmr847344eaf.4.1719088125891;
        Sat, 22 Jun 2024 13:28:45 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:3d70:f8:6869:93de? ([2603:8080:2300:de:3d70:f8:6869:93de])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d55cd91asm749144eaf.15.2024.06.22.13.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 13:28:45 -0700 (PDT)
Message-ID: <daee6ab7-7c1e-45e3-81a5-ea989cc1b099@gmail.com>
Date: Sat, 22 Jun 2024 15:28:43 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] KVM: SEV: Provide support for
 SNP_EXTENDED_GUEST_REQUEST NAE event
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, jroedel@suse.de,
 thomas.lendacky@amd.com, pgonda@google.com, ashish.kalra@amd.com,
 bp@alien8.de, pankaj.gupta@amd.com, liam.merwick@oracle.com
References: <20240621134041.3170480-1-michael.roth@amd.com>
 <20240621134041.3170480-4-michael.roth@amd.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240621134041.3170480-4-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello folks,

On 6/21/24 08:40, Michael Roth wrote:
> Version 2 of GHCB specification added support for the SNP Extended Guest
> Request Message NAE event. This event serves a nearly identical purpose
> to the previously-added SNP_GUEST_REQUEST event, but for certain message
> types it allows the guest to supply a buffer to be used for additional
> information in some cases.
>
> Currently the GHCB spec only defines extended handling of this sort in
> the case of attestation requests, where the additional buffer is used to
> supply a table of certificate data corresponding to the attestion
> report's signing key. Support for this extended handling will require
> additional KVM APIs to handle coordinating with userspace.
>
> Whether or not the hypervisor opts to provide this certificate data is
> optional. However, support for processing SNP_EXTENDED_GUEST_REQUEST
> GHCB requests is required by the GHCB 2.0 specification for SNP guests,
> so for now implement a stub implementation that provides an empty
> certificate table to the guest if it supplies an additional buffer, but
> otherwise behaves identically to SNP_GUEST_REQUEST.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 60 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 7338b987cadd..b5dcf36b50f5 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3323,6 +3323,7 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
>  			goto vmgexit_err;
>  		break;
>  	case SVM_VMGEXIT_GUEST_REQUEST:
> +	case SVM_VMGEXIT_EXT_GUEST_REQUEST:
>  		if (!sev_snp_guest(vcpu->kvm))
>  			goto vmgexit_err;
>  		break;
> @@ -4005,6 +4006,62 @@ static int snp_handle_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_
>  	return ret;
>  }
>  
> +/*
> + * As per GHCB spec (see "SNP Extended Guest Request"), the certificate table
> + * is terminated by 24-bytes of zeroes.
> + */
> +static const u8 empty_certs_table[24];


Should this be:
staticconstu8 empty_certs_table[24] = { 0};
Besides that,
Reviewed-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>


> +
> +static int snp_handle_ext_guest_req(struct vcpu_svm *svm, gpa_t req_gpa, gpa_t resp_gpa)
> +{
> +	struct kvm *kvm = svm->vcpu.kvm;
> +	u8 msg_type;
> +
> +	if (!sev_snp_guest(kvm) || !PAGE_ALIGNED(req_gpa) || !PAGE_ALIGNED(resp_gpa))
> +		return -EINVAL;
> +
> +	if (kvm_read_guest(kvm, req_gpa + offsetof(struct snp_guest_msg_hdr, msg_type),
> +			   &msg_type, 1))
> +		goto abort_request;
> +
> +	/*
> +	 * As per GHCB spec, requests of type MSG_REPORT_REQ also allow for
> +	 * additional certificate data to be provided alongside the attestation
> +	 * report via the guest-provided data pages indicated by RAX/RBX. The
> +	 * certificate data is optional and requires additional KVM enablement
> +	 * to provide an interface for userspace to provide it, but KVM still
> +	 * needs to be able to handle extended guest requests either way. So
> +	 * provide a stub implementation that will always return an empty
> +	 * certificate table in the guest-provided data pages.
> +	 */
> +	if (msg_type == SNP_MSG_REPORT_REQ) {
> +		struct kvm_vcpu *vcpu = &svm->vcpu;
> +		u64 data_npages;
> +		gpa_t data_gpa;
> +
> +		if (!kvm_ghcb_rax_is_valid(svm) || !kvm_ghcb_rbx_is_valid(svm))
> +			goto abort_request;
> +
> +		data_gpa = vcpu->arch.regs[VCPU_REGS_RAX];
> +		data_npages = vcpu->arch.regs[VCPU_REGS_RBX];
> +
> +		if (!PAGE_ALIGNED(data_gpa))
> +			goto abort_request;
> +
> +		if (data_npages &&
> +		    kvm_write_guest(kvm, data_gpa, empty_certs_table,
> +				    sizeof(empty_certs_table)))
> +			goto abort_request;
> +	}
> +
> +	return snp_handle_guest_req(svm, req_gpa, resp_gpa);
> +
> +abort_request:
> +	ghcb_set_sw_exit_info_2(svm->sev_es.ghcb,
> +				SNP_GUEST_ERR(SNP_GUEST_VMM_ERR_GENERIC, 0));
> +	return 1; /* resume guest */
> +}
> +
>  static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>  {
>  	struct vmcb_control_area *control = &svm->vmcb->control;
> @@ -4282,6 +4339,9 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
>  	case SVM_VMGEXIT_GUEST_REQUEST:
>  		ret = snp_handle_guest_req(svm, control->exit_info_1, control->exit_info_2);
>  		break;
> +	case SVM_VMGEXIT_EXT_GUEST_REQUEST:
> +		ret = snp_handle_ext_guest_req(svm, control->exit_info_1, control->exit_info_2);
> +		break;
>  	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
>  		vcpu_unimpl(vcpu,
>  			    "vmgexit: unsupported event - exit_info_1=%#llx, exit_info_2=%#llx\n",


Thanks,
Carlos

