Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56628EA
	for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665596022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UTPY4QglHL7ForE7N9Phbp2eYt/wSONruT5ELzZf8Uc=;
	b=P9B+m9qC02T91oypey1IP3JMXjlEqBUqgJq3hcHDXFKe7HvgKvOvheOroW8klhM+DrMvBr
	kWVKPn+uUpw0fccXDmP+AcZrd+fILdbt5Szaum5JCKK8U9KImwbgGz0Q+F8K5cGZjvXm8t
	OVsp+DOYCk+Rnp2JJHrlllA9Hk1YssU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-NwZwcR5_MBWR7-CcpBxXhg-1; Wed, 12 Oct 2022 13:33:40 -0400
X-MC-Unique: NwZwcR5_MBWR7-CcpBxXhg-1
Received: by mail-wm1-f71.google.com with SMTP id bg21-20020a05600c3c9500b003c2acbff422so1973834wmb.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Oct 2022 10:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTPY4QglHL7ForE7N9Phbp2eYt/wSONruT5ELzZf8Uc=;
        b=yctsdyoycjV40RhximNgbHlgp1uPGPWpyb2OxuJ5iJRvY0Z7F6rrihcluKAxZgQ9OX
         7IvKKKuEM/zBddNZpkfFayZTt9or/GptRmTB0qbi062/XHt9gDglM8RPpgBvfAdJWXfC
         gW2JDveoFuRSwVk8GuYovEuLJhF4aGE28erm2ctiH0cPaGqaaCrvjYnXfUlPnY1KB3nt
         nwpRR4/eXoqySJaYUh6ODoUP6AHe0CPK7pW0vLFFKVCm2fUKmGjKsu/rUuFwiGJe2C7P
         9FO2sGFkiglb+4x+IKmPnXMOa4EIiLtXeWDIzoUWvDoiQ6o3eWjhJz7VLcHTe2ndkh3r
         KKjQ==
X-Gm-Message-State: ACrzQf07gJm68eDt4gCbf2knJppKq78m1p392RxU+lep461/o9iVzsDG
	tS7PKG3Ow6XyA5nEBc3Q47sbXEEILR9cOuyIN5nfF5t7A0mR0yQv0r8wwFI+/GcnkQJvBOA0/nw
	hC6iiin/VAPKgS9uxKVoEeA==
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id a10-20020a056000050a00b00225210ca7e4mr18791000wrf.704.1665596019515;
        Wed, 12 Oct 2022 10:33:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Ag/JZjuJhMs5PsbZsgnm/0wHN9JUkoXAmGc5/k5zqugrzCXH+mKICHusEoHNnc5XwSKo5uQ==
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id a10-20020a056000050a00b00225210ca7e4mr18790991wrf.704.1665596019309;
        Wed, 12 Oct 2022 10:33:39 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id bn13-20020a056000060d00b002286670bafasm238194wrb.48.2022.10.12.10.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 10:33:38 -0700 (PDT)
Date: Wed, 12 Oct 2022 18:33:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: SVSM vTPM specification
Message-ID: <Y0b6cDIMlKijT95S@work-vm>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Tom Lendacky (thomas.lendacky@amd.com) wrote:
> I'd like to approach this from the standpoint of an enlightened guest with a
> TPM driver that is SVSM aware. I'm by no means a TPM expert, but I'll pose a
> bunch of questions to see if we can start moving forward.

Thanks for starting the discussion off.

> What would an enlightened guest need from the SVSM for attestation of the
> SVSM/vTPM? What would a vTPM driver need to supply to an SVSM for TPM
> operations?
> 
> For attestation, the SVSM could provide a VMPCK0 attestation report. What,
> if any, data should the guest supply to the SVSM to be part of the SNP
> attestation report data? Should this attestation request be part of the SVSM
> base protocol?

I'm not quite sure what a 'VMPCK0 attestation report' is?
It's important that the VMPL level in the attestation report reflects
the side asking for the attestation; in particular one TPM story goes
that the firmware (in VMPL0) would ask for an attestation and the
attestor would return the vTPM stored state.  It's important that the
state could only be returned to the vTPM not the guest, so the attestor
would check that the VMPL level in the attestation was 0; any guest
attestation would have a VMPL>0 and so the attestor wouldn't hand it the
vTPM state.
Hmm or are you saying such a report would be triggered by the guest
rather than the firmware, but it would be protected by VMPCK0 so the
guest wouldn't be able to read it?

I think one of the vTPMs keys should be in the SNP attestation report
(the EK???) - I think that would allow you to attest that the vTPM
you're talking to is a vTPM running in an SNP protected firmware.

> For the TPM, is it enough to emulate the TPM device register space? Rather
> than using a PCI BAR or an ACPI memory resource address, could the vTPM
> driver replicate the TPM register space in ordinary memory for the SVSM to
> process? Should this memory come from the SVSM or from the guest?
> 
> Or is there a better, more efficient method that can be used to perform TPM
> operations? What would that look like?

Can we make this look as close to the TPM CRB as possible; from
discussions with others it looks clear something extra is needed; but I
don't see the reason to be too inventive.

Dave

> Here's hoping this starts the discussion...
> 
> Thanks,
> Tom
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

