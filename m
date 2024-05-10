Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5A315E86
	for <linux-coco@lists.linux.dev>; Fri, 10 May 2024 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715361952; cv=none; b=tfpOLvIHacG3i2ugfuu16mKuKxlzHSOwAkdj5yd3z9urfSWCzpIwAphbLzN0M+157KB8AwuQHKEdSvNVnKIHTjv1vLiYVdbGzlK0fX5sLMRB2XDVzo+21Rzf9oX5y0uchWQbQfbhif5/lhJ4o58/59F4z3j82HrmCs97tlU41FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715361952; c=relaxed/simple;
	bh=EsLzXB6Gs7ZQtkmepgwzqKCcyMI9oEm1j34c4xvtcr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQzFFATzAIXbuxObi606EZUfESeo4jIL5KAq2CANe8JKpU7EQHGUCzhvio8GXid+AjfVaClupoIZVWDIGGUhMXlmSL9VcNMTFJLdPcEe2DT5a7DE7MR0ImIsPe7K8jOsiLe0Q1otNZ9ADKfvVAidKY2DhtZ0BKnwaAHuj3RhFSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEpx37XB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEpx37XB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715361950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0uH1Y67e/JYlAU3ZBz+NOGOD31UpxofQKkMvjjtZOo=;
	b=hEpx37XBTAO0dvP8mJEq6vNtmHvRWAEfOT1RbbTrgkBq8QWYgEo/tmWbgdJABmKZhE1yVK
	F1Mg8QmVgXQSpVd4uT7w+ojtIkZdlxgp1G59JusiHdSfzbf+HN28YPUHP5kQLT67QRXs5v
	CRgeKk6VkxukstWaZyTIVZ6+8C9K3f4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-e2kE5kIDONaAXp0Ey0TVOA-1; Fri, 10 May 2024 13:25:49 -0400
X-MC-Unique: e2kE5kIDONaAXp0Ey0TVOA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51fa975896eso1917397e87.3
        for <linux-coco@lists.linux.dev>; Fri, 10 May 2024 10:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715361947; x=1715966747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0uH1Y67e/JYlAU3ZBz+NOGOD31UpxofQKkMvjjtZOo=;
        b=YvKIIpbulezVRJQA/hNEiZ6jplEjkd1S3dWWnVlIHuaGwOdopmP7tiiTGEREQhop3y
         drywkRiA6qgTLX+CA6s765GcFsK5sTm+qf3FKVH3kE4Kz9VcymD4N5drupsJUJjLCX3F
         i3+vjTwjcct7gxE6h9GkoEON0c7vQPT7Tq987hl4LuRk/9AXqiCeMzZ1oRz97if0sSCX
         qQXbZ3cX9TAmXlXTmH5//N5YCT6HutTXS6Cv/4ly7R/53f8FT0U0y2gFcEECHxGPg8iz
         p+Fj1ESQnpEOpZEnVM+GaijRcadh9n9b4TLTmI1NvRpZHk9+nqj4+VfjpXAC8MAApTF3
         KN+A==
X-Forwarded-Encrypted: i=1; AJvYcCWuYvXpTYBGSwKuMlQIDA2N8WPg++3pfDEJTx5kAgothlIZsFJmFkGUJZaDnyu4g9EJa3cdK77ZP7lgoD4U0Yk1w5oGad+Y34bkzA==
X-Gm-Message-State: AOJu0Yz2Sy+xvfzsqwxR0kKUZFO2QX9mKPSbwwBoWODMabuTZyTDsYh1
	4gOzv+UTxOc8q9N9NvvAyD1J77WizNH1RxktiLOxo8q7nM4h8a9zFPq/7/PVBI0CCq7i1fkAriJ
	hUhBGtEcVZHZSbUNN9cfzxyJMH5CbOPZBJjIJyCqkQN1YiODcC45S/iBMjTDsTILVLt20H5rVEL
	8azgMAsspya74C3MzLeUKPOvVzXgZK8IGqFQ==
X-Received: by 2002:a19:a40f:0:b0:522:f6:9268 with SMTP id 2adb3069b0e04-5220fc7eed8mr1904837e87.31.1715361947342;
        Fri, 10 May 2024 10:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+3UgqTDnmRVAiNjyATZxMd/ldNZtXGyYEy7zEh+oH8PVqYii06B+EkIez4lJParuMv/x2eUO16iD1lvVu4gU=
X-Received: by 2002:a19:a40f:0:b0:522:f6:9268 with SMTP id 2adb3069b0e04-5220fc7eed8mr1904804e87.31.1715361946880;
 Fri, 10 May 2024 10:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240510015822.503071-1-michael.roth@amd.com> <20240510015822.503071-2-michael.roth@amd.com>
 <Zj4oFffc7OQivyV-@google.com> <566b57c0-27cd-4591-bded-9a397a1d44d5@redhat.com>
 <20240510163719.pnwdwarsbgmcop3h@amd.com> <a47e7b49-96d2-4e7b-ae39-a3bfe6b0ed83@redhat.com>
In-Reply-To: <a47e7b49-96d2-4e7b-ae39-a3bfe6b0ed83@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 May 2024 19:25:34 +0200
Message-ID: <CABgObfaJaDr38BsTYRrMQzYr-wK8cLW+TJr5ewsgBEcm8ghb3g@mail.gmail.com>
Subject: Re: [PATCH v15 22/23] KVM: SEV: Fix return code interpretation for
 RMP nested page faults
To: Michael Roth <michael.roth@amd.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-mm@kvack.org, linux-crypto@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, papaluri@amd.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 6:59=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
> Well, the merge window starts next sunday, doesn't it?  If there's an
> -rc8 I agree there's some leeway, but that is not too likely.
>
> >> Once we sort out the loose ends of patches 21-23, you could send
> >> it as a pull request.
> > Ok, as a pull request against kvm/next, or kvm/queue?
>
> Against kvm/next.

Ah no, only kvm/queue has the preparatory hooks - they make no sense
without something that uses them.  kvm/queue is ready now.

Also, please send the pull request "QEMU style", i.e. with patches
as replies.

If there's an -rc8, I'll probably pull it on Thursday morning.

Paolo

