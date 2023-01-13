Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C52115
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 18:53:10 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gz9-20020a17090b0ec900b002290bda1b07so1841169pjb.1
        for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 10:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nX0c1e72RVwINfSjcTE63ePQA4G0ZSXJ7PPfsTUue9k=;
        b=es+B8M3PzS8zElJciRPCR83Qo3FCm5ZCrVjnA7dzitarF1A/9HdpRSj3ez2DVSlqj4
         CbrH+f2sHAPsRYUI+U+ZA3EhAqpTdRA+Gl2qKRO291nktBSDwz4UDWoxiL4ea15QizeK
         HmxXz75f2pC8lAFxwS9p8je6eX5DkVZWQ5cs7U1ZMtEdXvwCuci6lmqGMxlmtFm6iKuZ
         eUoW831HheZ3NF8FHdkNqOYqZeZ/c3RajYxtBgjqe6suFTMekxcbvL/zzDHyCVGD0WrU
         tSkr+R8iU9R2C1ETdbOqy+dlC2TdQZsQUYAcWHqTt/8MMADdTLg8dOWkDqzdD7vtUpe/
         y34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nX0c1e72RVwINfSjcTE63ePQA4G0ZSXJ7PPfsTUue9k=;
        b=Yo5DsJpjBQ+hlnVP4UJX5JsXozp8Ddj6FzfoL162yhKZltynr82s9USNQFK0PYu1hY
         6N/jzwcbSgCG/UXaypFjw07R0bxy++waD0ccrJ+J+VMjXtg5Kbr64wTaWCBSxHKuqUwD
         AjX8WcgwHDcKFIL6vuQeIJF8lMTNm9JeVwoiMEgfK0fFqoeviUt9tXzFzaSDcnJas1NI
         5Y3HkwEOtxD51E/RZKDB2B4kezMIm3/lEj1Zg2iY0mBJuXtFSoqu/7Qgv7UsX7u1zRDZ
         +yYObdn+3BbxNsYgNWW7KI0c5UP4tJUVsvq4JZgmtzMyfAAu9JNRk9fBG0akWp7y55mO
         LakA==
X-Gm-Message-State: AFqh2krI7V193An2BNx0RsZM4IUHeWv5QoQZrkAwmQrB3kKQObz1UyB4
	b3vQY9gAxC3Xowlum+1Fzlixq/5lyjFVtU8W4HuFcQ==
X-Google-Smtp-Source: AMrXdXugab51lW2zCA7pIfn4HH7ZxC4FfKeLKFxMb5M4BZvNTyy594B0xJgRj+Qww1/IDkTNqIScVTYpijX1fXFNTXI=
X-Received: by 2002:a17:902:c78a:b0:193:2d08:d6e4 with SMTP id
 w10-20020a170902c78a00b001932d08d6e4mr41869pla.97.1673635989614; Fri, 13 Jan
 2023 10:53:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y8AbnM0cnKfXXW23@redhat.com> <Y8GTXpfqlOe53cEr@suse.de> <Y8Gi0KLj5JbhCqBE@redhat.com>
In-Reply-To: <Y8Gi0KLj5JbhCqBE@redhat.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 13 Jan 2023 10:52:57 -0800
Message-ID: <CAAH4kHb=3nrAMR3GvpvyG0y__-USmZgV=FBSqtecw+ECXXoqpQ@mail.gmail.com>
Subject: Re: SVSM initiated early attestation / guest secrets injection
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, linux-coco@lists.linux.dev, 
	amd-sev-snp@lists.suse.com
Content-Type: text/plain; charset="UTF-8"

>
> Aside from what James' says, one option is to lockdown the OVMF and
> secureboot chain. eg OVMF built with SecureBoot=on, and instead of
> having the generic Microsoft keys enrolled, have a distro specific
> key enrolled. That distro key would have to be one that is only
> used for signing UKIs (Unified Kernel Images), and the initrd embedded
> in the UKI would need to be designed abort if it finds the disk is
> not encrypted.
>

IIUC, the disk doesn't need to be encrypted, it needs integrity. We
can't treat booting to an encrypted disk as booting to the expected
encrypted disk.
Everything still depends on rooting your core secrets to your
workload's identity. This relies on an integrity-protected initrd that
has its root hash measured as part of the kernel_cmdline.

The secret-holding server should only ever release secrets encrypted
by an attested vTPM binary (SVSM-generated public key) that has sealed
the secret to the workload PCRs.
This kicks the problem to the server and VM having pre-agreed on
what's the expected combination of OVMF and SVSM. So yes the vTPM gets
its core secret transferred to it before the PCRs get set to the
expected values, but that's part of the attestation dance with the
initial registration with the secret-holding server.

> The main challenge here is that you don't have a single OVMF anymore.
> You have many OVMFs, one for each distinct set of distro SecureBoot
> keys, and the attestation server has to decide which one it wants
> based on the distro the VM is expected to use.
>
> If we don't do any of this, then the early attestation and secret
> fetch would have to be limited to /only/ the secret for unlocking
> the vTPM state, and not injected into the guest OS. The OS would
> have to do everything else with the vTPM and PCR sealed data to
> achieve the same end results of only getting access to secrets if
> the vTPM sees the set of PCR values corresponding to the desired
> UKI secureboot keys.
>
> Ultimately the latter is probably the more common case and more
> flexible.
>

I don't think there can ever be a one-size-fits all base measurement
to seal secrets to, since there's always the final variable of the
workload.


-- 
-Dionna Glaze, PhD (she/her)
