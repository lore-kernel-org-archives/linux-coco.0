Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F7BBA4F
	for <linux-coco@lists.linux.dev>; Tue,  7 Mar 2023 20:27:54 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id s18so8378235pgq.1
        for <linux-coco@lists.linux.dev>; Tue, 07 Mar 2023 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678220874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=chEH0KNzrBuloEROXjZiSoXhQsMFVM7sy6f+QKt1R+M=;
        b=Cxx2e5Om+/JU6xnjHrLu/LLpcHm4CrHFFpL/hkI/hIygvlFl3O282SQeTSM9DKxd67
         tFUXnskfDcHZa3llmZ8srtrvCWgqt7ei2BgBxf6B94eqw2e3QG+VkA74CGShJr9mAMQB
         xQU5e6/s1iiQuPUiFMX9lTakxHUPHl1FuY3ieNs/V+6Rcj83ATP7L/GVsTNaGTQiTnaG
         PLquYfnfv/Hkz5CC0SSCVyJFhSD0ha2z64wkpDnzoV3oWrm3LrPEFjH0e8BuXOneOBLI
         TkysZVIdzjNAaAz2qlnc1ahbgabERONj+zhSAV2u+3ifVbhPYUXu6kLs6toM80728i4V
         3S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678220874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chEH0KNzrBuloEROXjZiSoXhQsMFVM7sy6f+QKt1R+M=;
        b=0Cc1x9rECxA3xZ1YV+BxtUhUOSOXF9osCfLXXPQpIYGEjlejYnuafEsc5zhtpdXajz
         VnBPPeFk5cj8Npcdz23sbWrGTIZAk80GKXwWPeyYAFVIbrryV3n440PP0o4R3aNPKH4O
         Rmy/q5voCvxbwmKgVfoHKUbcDKuZGw+GfofJ+AO23Eio2CkW7MKRodGZWjKNjEgCibfT
         fBx4T6Qj8xzWT+BirOmn+/rf+6lRM2Q6L8MBcs1U1IZvM1m/DIiq+p28vsPOeaxZnU21
         Lve7tkDgtoRRpo1mkoZ9CDHgq62XioF7juuzN6GwYzJJLguPrj26KGzKZE5ieNLdFUc+
         S/Tw==
X-Gm-Message-State: AO0yUKXaPhbB8jeaPmLvsG0RDUT2VuHY8Eiu3N76DXRh4iRpuhXTc82Q
	v/b289aQQpL/0gKNXAwiV8R6tKei93cGbXhbPHwDKQ==
X-Google-Smtp-Source: AK7set+9pDs0ZFsuVXAGl6BXAyTVyDFGxn4N+j3GphqyC9WCb47N2cOGoWCjaCLDbR8bCBL0/Uf4b45+2yV46m3aEfE=
X-Received: by 2002:a63:9319:0:b0:503:7bdf:df4b with SMTP id
 b25-20020a639319000000b005037bdfdf4bmr5783096pge.3.1678220874310; Tue, 07 Mar
 2023 12:27:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307192449.24732-1-bp@alien8.de> <20230307192449.24732-10-bp@alien8.de>
In-Reply-To: <20230307192449.24732-10-bp@alien8.de>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 7 Mar 2023 12:27:42 -0800
Message-ID: <CAAH4kHbaiBOxJZbZv+fvnstGknugjvhR5uWKK8aBXM2rDBGdRQ@mail.gmail.com>
Subject: Re: [PATCH -v3 09/11] virt/coco/sev-guest: Add throttling awareness
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>, 
	Michael Roth <michael.roth@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, Peter Gonda <pgonda@google.com>, 
	Tom Lendacky <Thomas.Lendacky@amd.com>, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -320,7 +323,8 @@ static int enc_payload(struct snp_guest_dev *snp_dev, u64 seqno, int version, u8
>
>  static int __handle_guest_request(struct snp_guest_dev *snp_dev, u64 exit_code, __u64 *fw_err)
>  {
> -       unsigned long err, override_err = 0;
> +       unsigned long err = 0xff, override_err = 0;
> +       unsigned long req_start = jiffies;
>         unsigned int override_npages = 0;
>         int rc;
>

Not blocking, but I do think in the previous version we discussed
changing this to the SEV_RET_NO_FW_CALL value instead of 0xff. I agree
that should be a later cleanup.

--
-Dionna Glaze, PhD (she/her)
