Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5046C3D0905
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368328; cv=pass; b=i0uJgOmgRgkDuIrtjo2sp1maXgw18berX/zv2oWca49CUSON9hrlIBGorgNcmcuaXENcZRRSXUsGUZdEn3grPxMQfRw/MiAvEgEgIbDKTIl+0nvmBPF5I6VGvAiZri0ZGwLULC7kV8A3+XR/dztFUBzvGffBeSbofWgvX1bEZh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368328; c=relaxed/simple;
	bh=cZzLDtUOUx2+M6TxkHymIb2lPpb+5tNDsr6avCKlGmI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=suGyJFNnmc4ymzKgT72CiYO+1xhQOcWuj2Tv5ilHfQXoawHWZz7cOlejDRbmSp36KXOKte64eAd2SbphZPpQZVP1XW+3xbrz/J64el9jLt0R5m9t+jxwZmjTRHhuPRQf4eXEOCteO+/AVwWStJwSfGo9Vs9imMWqpFsiALmApso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AT37cjnt; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AT37cjnt"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so24131715ad.1
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 13:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783368326; cv=none;
        d=google.com; s=arc-20260327;
        b=Ra57bOfWUZJRX6uvw7ehoh+ALrzE9e6bWSIY0Nd86hgQfAKlORz5ZKw1T+aThqX3vn
         +4gbzwcAb0o1Sm5xPJ83Se2yLvTovgFaVtCtWnsbOPu+6leVxSY/fkj9BJaIgrAHh2fl
         U2EQV6+V/R+BC2HpbGZdHVyNiJbb9pflOmOiFzZ5qqT+COnMj2pucQIYggAEaxpTtCRt
         5OBSa5kiM6bxF/Ou8bY+fhF7eKp4v0RBxc+uCpCyhNE9WhQaet7M9wVK8qwU27hjspUx
         ruuIpQ/kslmjDYExgYmOvPQH67h44A+kjxaWi74PsF46HarfJvdC7B+E1u88SxnXkLZO
         9NiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y1sJvcjfFSzHCYkLQviAR+AOvGzP6D3rFksnjCW+sao=;
        fh=ZLTOShWBpFbVLYpd4mmzXjMgGU0FMzKvI+LBqvlQ2uM=;
        b=rNh7mQtLGA6n3zcInvmGGrhhPUKFJnVdIlYth25CqGLKAZUpoxl+0whCMCmrICgXwv
         lnJzxZ6NyMvliDzaimGITgL25zw9UJydbaIiBZLGpcuELQc6DrchRRY7+Hb5OafCw9OR
         bJOtEZvQgpN+952HBRJ2RULBvSegvDzdwBainGOMio6m6Fz7p9Ehof+a3KcZql/0QvCE
         KsGUu2UwPXq/Zle/BdDl0oazL5uz1PqPzhssbMxQJEJS8/1nUBRjAzIE0qreRlW8M4Lj
         hvz9IaGkvjtKXxBtjrl5p+cUplkQmtyVM6Owc4q/maJpS4CcvTkOuw9fy5CTW7jXBHLw
         7XwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783368326; x=1783973126; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1sJvcjfFSzHCYkLQviAR+AOvGzP6D3rFksnjCW+sao=;
        b=AT37cjntuXR/g+CYEGQS9XitybFEtarmvNTdqoL0DoKdy/leOL1wS56ckwUN/hB01/
         rAh4GBhA/bvJUtCAH3tkzjrQUxZ6HxY7Wkdnq3Rtxmkrxhg6YlG/dvvpz9od8/+D/zoN
         yCllkhJkLi8+In9chRQg2UA/Yher9ipZ1ze4UcrohVfhMNLToKXfY/qVxHzuOHwgE9cX
         jlS14HoRutGdHA0e6pzGOqht+pOyVo5wmHdE6cAww5YlU7nbkuij5O5u3AEr6brK++aP
         GpK/nmWu+YnSo2lOHM9P375o9RPROIciDGmNyRIZHF1bQo+IqS7YkNpY+s1N3kh5CR/v
         BZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368326; x=1783973126;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1sJvcjfFSzHCYkLQviAR+AOvGzP6D3rFksnjCW+sao=;
        b=hbT5QyK9U80UWsIZtmsLb0v8GpcQETdx2Q0lOK3PvDyK1mQcdsogrehw+CACZA3MDh
         v87kikphGJHFSFedrZui66Sd6jXlJn6kncoX26lJLetCQ7rxCsVQ5Xyo25fbn6XG+NvV
         tmBIxrcqSYBPHPCp1wgxc98CX8yH4WosINbK3WM1xsBwEdXuQR8aSP2cXVVUrjGyj+tj
         ciHIOLvWyFGXmD1K8W3oEg5Q+FTzfx7UYiLBgsP61KwzjVxAkcxrVAVEwXYhyDdn7CQa
         DA9vmiVBRx1pDEoo7jTtUiYki1isSl8xVLAwM7cOI4a+FRshLxW+r7MZSGflxi8B1KSs
         dDjA==
X-Forwarded-Encrypted: i=1; AHgh+RoixwKq+0BUdKBDLMd76aXM/vxsFZS8RdoN5KHNDNx56Z4Hg/H+C66OszUpr4TLRfiAtdkM1T0RuUEN@lists.linux.dev
X-Gm-Message-State: AOJu0YyIXoJszR2ktU43ts3yg8FwBWe8RXVepAKZZ/8VfNajosXzGufS
	UZqJkbwVz2naEsmZmKTgkMkMGhBkoWCuE1KyIiw2vbaJ5ZOEb/lvY8LRShUluGkgh8uFX8a35og
	Cbk8lakymU6mZ0+Zs/CQTaShU/VWKYYGdcVUPLxLc
X-Gm-Gg: AfdE7cluO8IS1EncHeszwPEPKVp+6tjF1YIXVUZUtVEGMRh5+jKetqk9U5V1qsJhlJ5
	/C3W7wCnU3TtSfvVCWzBO4qlOZJXo/9+rHiH6FDS/DdV5CnhQUjKyS0XKQJtAd3Ae7zBNu6j35l
	Hc/YRst8Os+Hfy7XFLMx7pOwvwd62S1h6yW7t0BnXSaEufqalPl03NGcJFzwa/rvF/5ijHCi3Mq
	AiYRSydlJCnCNqmOsnXiz/kImATwFpUwjLbG2xR55Vg8FebYDiVvX4upeqjwjEcBPe9NKBZAMZ5
	e7J1VeoM8Gsex4lvWwiZEHMszYpQ9aiE9qWtF1S77OnQRGn9HmD1M1hfXWk=
X-Received: by 2002:a17:902:fc8e:b0:2ca:e0ff:e696 with SMTP id
 d9443c01a7336-2ccbe509767mr23472615ad.9.1783368325085; Mon, 06 Jul 2026
 13:05:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 13:05:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 13:05:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260327160132.2946114-31-yilun.xu@linux.intel.com>
References: <20260327160132.2946114-1-yilun.xu@linux.intel.com> <20260327160132.2946114-31-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 13:05:24 -0700
X-Gm-Features: AVVi8CfBjO2gULD3GETeRHh9h0KndZBQaojE74hhluZ7n9qbjhbk_11LUC5m6bk
Message-ID: <CAEvNRgFpD3xOAPJPziVy0EvT61a0jjAf2VH0X3ZeHC2z3Om8nA@mail.gmail.com>
Subject: Re: [PATCH v2 30/31] coco/tdx-host: Implement IDE stream setup/teardown
To: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev, 
	linux-pci@vger.kernel.org, dan.j.williams@intel.com, x86@kernel.org
Cc: chao.gao@intel.com, dave.jiang@intel.com, baolu.lu@linux.intel.com, 
	yilun.xu@intel.com, zhenzhong.duan@intel.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	xiaoyao.li@intel.com, vishal.l.verma@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

>
> [...snip...]
>
>  static int tdx_tsm_link_connect(struct pci_dev *pdev)
>  {
>  	struct tdx_tsm_link *tlink = to_tdx_tsm_link(pdev->tsm);
> @@ -362,7 +579,15 @@ static int tdx_tsm_link_connect(struct pci_dev *pdev)
>  		return PTR_ERR(tlink_spdm);
>  	}
>
> +	struct tdx_tsm_link *tlink_ide __free(tdx_ide_stream_teardown) =
> +		tdx_ide_stream_setup(tlink);
> +	if (IS_ERR(tlink_ide)) {
> +		pci_err(pdev, "fail to setup ide stream\n");
> +		return PTR_ERR(tlink_ide);
> +	}
> +
>  	retain_and_null_ptr(tlink_spdm);
> +	retain_and_null_ptr(tlink_ide);
>
>  	return 0;
>  }

Would it be possible to define .connect = tdx_tsm_link_connect in the
patch that sets up spdm, and then update tdx_tsm_link_connect in this
patch?

I think it would help in showing how the spdm is associated with
tdx_tsm_link_ops.

Would it also be possible to bring the definition of .probe in
tdx_tsm_link_ops till after this patch too?

> @@ -371,6 +596,7 @@ static void tdx_tsm_link_disconnect(struct pci_dev *pdev)
>  {
>  	struct tdx_tsm_link *tlink = to_tdx_tsm_link(pdev->tsm);
>
> +	tdx_ide_stream_teardown(tlink);
>  	tdx_spdm_session_teardown(tlink);
>  }
>
> --
> 2.25.1
