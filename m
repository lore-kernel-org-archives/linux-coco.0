Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C844315886A
	for <linux-coco@lists.linux.dev>; Fri, 31 May 2024 13:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161064; cv=none; b=kb6aMKwDgyLjUykKSsJO0p3TP4h27uX1fYnJ8lIrnkh3XMHmAKe31vSSASSN2Js5sK1HwPDDcoWQhAp/cXK1lgp/RMtVWXoFO4+dmTUBKGq1f2EBodZlLTRFTKto4U0fgM/xm4uA/W/erHxuCC0eYa+PS3UNNUteWt4GQlDUAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161064; c=relaxed/simple;
	bh=CqLmmdZ2wecXUVkHp+HXQRJLjMCpZYdCiUOYNmrEQ+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDOwqEn+eBkhlB5W8Sk6pmOqTXycJPy7W0TyZOOsjwzH8PMOL8d/3Vq1lBw5qvWg8pES0jHOk+wc3sTAspQW+dmHngZYhjQyKyTDy3/ZFW2h1f0qsGX0g8QUfYtEYAulazeUNoMi3NEkeGYcSfoYfyqFACFXhd8GznNsi6i5Oyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Np/r4CDg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Np/r4CDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717161061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CqLmmdZ2wecXUVkHp+HXQRJLjMCpZYdCiUOYNmrEQ+o=;
	b=Np/r4CDg2ryFSQ5xk0thRU0NXvxzeu2a9EpxjDzvO6LUFlNmiZ0nhZMoEZsZB348Aw68Ld
	xeo7v1rPIO6M3VlFqXuWbCNNv3Uxz8WsvoiWNaDr9yiwarBdQeRNO2md/+9MnnY3tnY8kH
	0vxtD/CeoTbzwnCANo+YZSlg817/3NA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-VeK238z2O9GVhWZ7ch8V-A-1; Fri, 31 May 2024 09:10:58 -0400
X-MC-Unique: VeK238z2O9GVhWZ7ch8V-A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-35dc02b991eso1206085f8f.0
        for <linux-coco@lists.linux.dev>; Fri, 31 May 2024 06:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717161057; x=1717765857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CqLmmdZ2wecXUVkHp+HXQRJLjMCpZYdCiUOYNmrEQ+o=;
        b=e6Tsi5S5GLCWQTkAYjUIgyF9sJiEQJyTBHS+UrqTiyCMhLbYRwUQyV3G6XUIXC/eRQ
         crKBqJoLilVtBsABuVYuPPX9BDHRd2tjV3T1ghnLh+izWh36pMCfwl+maszJuAss9b82
         TMhkBRhO+KV0PZafSWpylZnOkfiGIqVxU/ELA8s4NbMZSte+vLYrEDEeHFGCzuNM/MdB
         y5zfbvwXuPAvGqHZ2SmbQ4Ep5LTgdbTuK19iKFP2bZpXQ5u6aukL/HsIICafgACRn5RD
         Lc6BUodY98iLw9cYmDZZeKcNlH0ehbOG5OIEwwnhMA65BBgK1229EzZPch97JyMwgNq1
         riZg==
X-Forwarded-Encrypted: i=1; AJvYcCWqcRJQcalVTVDyomyL8f/Kv71wLd4N7FBRlxslL4V1SES4MsDbq25h7qvBjv3cistfplrDr8sRkwwM1QW5hbQvo5kiGKAZWEhXag==
X-Gm-Message-State: AOJu0YyUcCcXNi+Z36qgLpefhlHHtVLTaOrFiw6XjvD2hg/HnVPb3aMU
	h7fZ28DB7a3zoeMFIMt4fWE7gwfyr/sZr9on7qOiuRXS/E0M35/8gnu9JKw6Th4ebiD0vY3u8gK
	wZbPVKSwiGZfXVK4NM8XorbM5oJ4hOTDJNnUH+WnvfmYpc0+O298xkdI3xToJQkh4dj0qWRyDwM
	fjAnRzotKWEjY7JgheTtXRwj/a/y7AIfC3wQ==
X-Received: by 2002:a5d:4bd1:0:b0:354:e0e8:33ea with SMTP id ffacd0b85a97d-35e0f37119cmr1303105f8f.66.1717161056777;
        Fri, 31 May 2024 06:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3gzv4GfxGaWcm8XMVixs3+MtMYgeFKTzpnPkZZHcTWqGRUOOsjVrY6Fxl3SCwOqZe8dfStn6ygQ2HzwmiDVA=
X-Received: by 2002:a5d:4bd1:0:b0:354:e0e8:33ea with SMTP id
 ffacd0b85a97d-35e0f37119cmr1303068f8f.66.1717161056377; Fri, 31 May 2024
 06:10:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501085210.2213060-1-michael.roth@amd.com>
 <20240501085210.2213060-10-michael.roth@amd.com> <84e8460d-f8e7-46d7-a274-90ea7aec2203@linux.intel.com>
 <CABgObfaXmMUYHEuK+D+2E9pybKMJqGZsKB033X1aOSQHSEqqVA@mail.gmail.com>
 <7d6a4320-89f5-48ce-95ff-54b00e7e9597@linux.intel.com> <rczrxq3lhqguarwh4cwxwa35j5riiagbilcw32oaxd7aqpyaq7@6bqrqn6ontba>
 <7da9c4a3-8597-44aa-a7ad-cc2bd2a85024@linux.intel.com> <CABgObfajCDkbDbK6-QyZABGTh=5rmE5q3ifvHfZD1A2Z+u0v3A@mail.gmail.com>
 <ZleJvmCawKqmpFIa@google.com> <3999aadf-92a8-43f9-8d9d-84aa47e7d1ae@linux.intel.com>
In-Reply-To: <3999aadf-92a8-43f9-8d9d-84aa47e7d1ae@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 31 May 2024 15:10:43 +0200
Message-ID: <CABgObfZZsJxQ5AKve+GYJiUB0cFc70qkDbvRB82KrvHvM0k3jg@mail.gmail.com>
Subject: Re: [PATCH v15 09/20] KVM: SEV: Add support to handle MSR based Page
 State Change VMGEXIT
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com, 
	ardb@kernel.org, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>, Isaku Yamahata <isaku.yamahata@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 3:23=E2=80=AFAM Binbin Wu <binbin.wu@linux.intel.co=
m> wrote:
> About the chunk size, if it is too small, it will increase the cost of
> kernel/userspace context switches.
> Maybe 2MB?

Yeah, 2MB sounds right.

Paolo

