Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053312F386
	for <linux-coco@lists.linux.dev>; Fri, 19 Apr 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713543227; cv=none; b=p2yoZhkv4cBtr3REspi0cf5SmH/LcL3TCVT+cN79eDJpzJOuIH3C1c3SrqqmGH7WhDbUbMTrE6nlUslbOOg1ewoLn4bX9Wje9gy9Z6Wg3i5O7Vh5Z5P+YVPxZytqZls3LDiMRrqtetsklIoDTXEExTLNP4wPZ1Jy+reaXze29UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713543227; c=relaxed/simple;
	bh=nLxECB9bMpQI6z8V9G04dNBlY46x4K0VVLSohnbBzYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuWa5eI0z8wTwXJASLNwDYbIMEY11A8r7HMEZBbNJn5ZiXUl2EMcj18fbmByqpL1xImeSccPJ7wlEyFGzD+F3a+gN/4R7IINMf2DH2DWXyk1Dr9m/+yRVd5uHEE72ZfTVxIojaDKY6Jgki4UAXPupwS0ZV+eoEVskj6hjYwby0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIZVcVIu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIZVcVIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713543224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLxECB9bMpQI6z8V9G04dNBlY46x4K0VVLSohnbBzYs=;
	b=HIZVcVIu5JU7nFfDo41kCjTnm+RMgxeVliRcaRd/FHxUsqySdBFjsazv93AKd2dyKUQzCF
	Arbfbhudwhq6HnC0OoX0Y9vT3x2OlDjW/dbJYJRPAp93LRxgfDj6DtACBbmZK6yPzzJTrt
	k03tIz8HxfSLX6T3jnboMr9pXrM7uwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-_x9V17yyOVuj5M3yuQ_eUw-1; Fri, 19 Apr 2024 12:13:42 -0400
X-MC-Unique: _x9V17yyOVuj5M3yuQ_eUw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-347f92ab882so1350662f8f.0
        for <linux-coco@lists.linux.dev>; Fri, 19 Apr 2024 09:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713543221; x=1714148021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLxECB9bMpQI6z8V9G04dNBlY46x4K0VVLSohnbBzYs=;
        b=OR2XNUcr5giX54OO+89aTaJriSS8/LfSbqfM8q0O2mTwpBpayVBLGQ4Oj8VHsX8W+2
         e1i6rUeZCjOaU/7HDt6/Ev426pMslK+Tp3xmJTNPVzfEZ3aSOBLAoQkVU0+Oo0oe8+5t
         zO8nkBHRRQUKQ9dINBtap6cFgvzliyLZae6ga4h2bnxDN+t1xoUMU7TnZTWmwan/ngKo
         R5oJtC+0PE9UyScy5aDCFWCTS4cOeHWoJOuyRCFcVTfeaXT6GYqRH67s93g/MBEKTliY
         JdFdrbQqu/kMP9m314M6xJrQyUe7yPK7596lv1eRZlaBkQIWg7Oa+tSeKkmnl9cHJcxd
         isDg==
X-Forwarded-Encrypted: i=1; AJvYcCWwOX1CuCrm+tZP4nhkm9KMclwRnLBt88xBdEsxp7uBTPa9QLgGB4GCAS19Ig2GljqjvwKRrQKNUGdJmzftA89kwDiPd+seE6XFbw==
X-Gm-Message-State: AOJu0Yz/8tYSOoBC/H3Wxacfu3wenGx1uwdbNBCcExTAIIWEU/o9Bwva
	UZk5qgL2ANPuBzEcR4rmSIzOJlqyx3pPAzeb/FEebwt6v6O6F0a3ph78elO4pHO3Awf7J7zZCJk
	Ei/jiaRnI1mYIsDaK+1BJmJMpz/2stt5ELYCj+FIQkfnElmHnyWmhV0sqmNz7REwkcgqzYEok1+
	XwHu01K+RuhiaPynl4Y774x7zJaf0EI9qssA==
X-Received: by 2002:a5d:5265:0:b0:345:66a1:d949 with SMTP id l5-20020a5d5265000000b0034566a1d949mr1596285wrc.0.1713543221704;
        Fri, 19 Apr 2024 09:13:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnajPMHcMdpRY04h+TNXdbRj7g/tI02Iw0JIqVHCpyfHEB4naUbmsOShyxFazrDJ7rYEXw5oIH9VgniqhruMA=
X-Received: by 2002:a5d:5265:0:b0:345:66a1:d949 with SMTP id
 l5-20020a5d5265000000b0034566a1d949mr1596246wrc.0.1713543221365; Fri, 19 Apr
 2024 09:13:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418194133.1452059-1-michael.roth@amd.com>
 <20240418194133.1452059-10-michael.roth@amd.com> <CABgObfYztTP+qoTa-tuPC8Au-aKhwiBkcvHni4T+n6MCD-P9Dw@mail.gmail.com>
 <20240419141920.2djcy6ag3peiiufn@amd.com>
In-Reply-To: <20240419141920.2djcy6ag3peiiufn@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 19 Apr 2024 18:13:30 +0200
Message-ID: <CABgObfapuKAVHwMpQbAxMu5WJCz19twSpzRGbPannQ68-vPU6A@mail.gmail.com>
Subject: Re: [PATCH v13 09/26] KVM: SEV: Add KVM_SEV_SNP_LAUNCH_START command
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, seanjc@google.com, 
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com, 
	jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com, 
	pankaj.gupta@amd.com, liam.merwick@oracle.com, 
	Brijesh Singh <brijesh.singh@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 4:19=E2=80=AFPM Michael Roth <michael.roth@amd.com>=
 wrote:
> So my current leaning is to send a v14 that backs out the major/minor
> policy enforcement and let firmware handle that aspect. (and also
> address your other comments).

Sounds good to me!

In the meanwhile I guess you can also update to have PFERR_PRIVATE_ACCESS.

Paolo

