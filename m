Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745156FD6
	for <linux-coco@lists.linux.dev>; Thu, 16 Feb 2023 16:44:06 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id r17so1848823pff.9
        for <linux-coco@lists.linux.dev>; Thu, 16 Feb 2023 08:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5lHEKGS4iAA2QjgfeM820tUu9WLfVn1gYRbv1+5aM4M=;
        b=lfgL8akf+l1IdK7B0oyQVNXkjGVpQ1U6iWgYVHJ5I2CbIR/dCbXqNMUFpsAG+el8oM
         f4j7ODaCfEDTlgno5HpMaLafyw5RPYHq17+/sHX+W5mNbyHMnAlG86Qx6edhXLp9uCw7
         9JFG/jjuWQKRzjuAylIoyUxHfnH3uRfbDyMz/0lI2lFPBVgEe+psJsDUp4xtlwHd48x2
         bwFqOid7zZvmR1gxgodJPuDe2QOaQ7nd99wBvS89oUrRTCtbaP4O0NPwKQUubYA8QEfE
         bzMI/+b9RCrcSg1yb7ZZXKEZdbBxivAlLjlIdWgOy+G4IeKljDsG3hzLlX5GzO9o3ANw
         2Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lHEKGS4iAA2QjgfeM820tUu9WLfVn1gYRbv1+5aM4M=;
        b=0ShB/KFZaakvl1jBK4KnvDapBuNlBjNwjD1JIAaUe0JkR/NTZRnbuVkMgW9OjymmjM
         TeTkYO3EQfjw7GLMbxP0YsaGakvzzjbW2+v/44RzmiVJaDL6cfzxyNhXbr2q1NLoEbKA
         Ru1brnoviL6WYD0SumkIB5t7fzy/fMAvOrrl/Y1KNKL9YLmcb3KYSTLEUrRNvMDDCNmL
         48lH6eo4TFrXKwp7GWM4ikx0BhEksE0sc5MHDOHtDRNEIH38GkBYhA1JBU7fLgymQip4
         gjZRXbN38r+qZX07O7D3jAkxEQkZYSV36h6mB04qyUu29tym/li73o5+rLxEnf5KfWAc
         Gl1w==
X-Gm-Message-State: AO0yUKXgOElNMT8oplgaX3gBy6WampZ7uWJTsdWzwvy1n2m2/JeuXxz3
	ql2PRWXO17S/qBZA+rWaOeoon5c70Hl3bDQf1fufFA==
X-Google-Smtp-Source: AK7set9juCzR2gBDo9sZT2TLPvY3/0nr5aw3pAHAYvA83KCk1K/596XCybO9frGI5Wk0y6bL8g7uuJnPs9/OO+nhlCE=
X-Received: by 2002:a63:360c:0:b0:4fb:c9e6:87ed with SMTP id
 d12-20020a63360c000000b004fbc9e687edmr934345pga.3.1676565845697; Thu, 16 Feb
 2023 08:44:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230216124120.26578-1-bp@alien8.de> <20230216124120.26578-4-bp@alien8.de>
In-Reply-To: <20230216124120.26578-4-bp@alien8.de>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 16 Feb 2023 08:43:54 -0800
Message-ID: <CAAH4kHaMCP0-=D1-QnsXa7wAtt22ZdTJD999hphKTpEQuM18aA@mail.gmail.com>
Subject: Re: [PATCH 03/11] virt/coco/sev-guest: Simplify extended guest
 request handling
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>, 
	Michael Roth <michael.roth@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, Peter Gonda <pgonda@google.com>, 
	Tom Lendacky <Thomas.Lendacky@amd.com>, linux-coco@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

>         if (ghcb->save.sw_exit_info_2) {
>                 /* Number of expected pages are returned in RBX */
>                 if (exit_code == SVM_VMGEXIT_EXT_GUEST_REQUEST &&
> -                   ghcb->save.sw_exit_info_2 == SNP_GUEST_REQ_INVALID_LEN)
> +                   ghcb->save.sw_exit_info_2 == SNP_GUEST_REQ_INVALID_LEN) {
>                         input->data_npages = ghcb_get_rbx(ghcb);
> +                       ret = -ENOSPC;
> +               } else {
> +                       ret = -EIO;
> +               }
>
>                 *fw_err = ghcb->save.sw_exit_info_2;
> -
> -               ret = -EIO;
>         }

I think *fw_err still needs to be hoisted out of this if block so that
a 0 fw_err gets written back to user space rather than the 0xff
placeholder. The 0 would more correctly indicate the lack of an error.


-- 
-Dionna Glaze, PhD (she/her)
