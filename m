Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D437883D
	for <linux-coco@lists.linux.dev>; Tue, 23 Jun 2026 01:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782177892; cv=none; b=LSRmhhp4egYRFV72G/Bduuz5ec6KWhrGbuR9ayU4/+rAWctaF+V2U7JW893EBp8gyQhLcj4jjlszPLatCyiJwk8CqM7JzKi9Iip7/DNtgFf8zvj9DUEY23j+RJKYGoMAcPVwe63inVUcOF799nGInMr0M92UGow4Y2h+IQjq4B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782177892; c=relaxed/simple;
	bh=efM0IjSTL/YXtmhicxOoTytgoByW6YhmiFqAN8KcL4o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uNX58QwzTBLqoI5pKz0WYoyvXk+5qY0FyPSUzYiaOSRqnNRrB2eoppd7LP4QImkpxarGC3rVyZ+Hj2tqqiv7+V+kXLDZiHVbQtUEy6P5GBXQYCH2RVW906ql0oarijNOAVqVSiIGVtgRSZJTC8mW8Xai0ptX3zc6H2MKSWljASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgIDetUN; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgIDetUN"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8894570b58so2469341a12.3
        for <linux-coco@lists.linux.dev>; Mon, 22 Jun 2026 18:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782177891; x=1782782691; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cP6zcq/A46NjpXBVqyG7Tuag7/oGP09m6JyCX4S5UME=;
        b=XgIDetUNpwQ6CN7reZy9q7HeuOMCX0zmiDqMT6FMsiigKKW8Wi79h//9wJuCIUCi/E
         Q50aRznEfjX9KUCZ2NssZs52B+k0cVUE9gixkC0B53CyFipKXiFAQyqUnicNMKkeVXn9
         t2Nv4vECwGQOzsZ46Sa4zr/GTewTZknrys/uLf0Xrt1T/wpjol+MWMR5GPGWUKhxOwi7
         GwR+ZoEUIe/NOtllZcfQBGpxomO4lzm37mIr1FOCnGrd1lcNNwR6I5jatWrbdu0BSmrK
         WwR8QzUjBbioqRvxHN59SRpiUAMQN7aJ5AgTVpCYFzA7D90eOTPGXcPizFkVrr4vSaft
         tyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782177891; x=1782782691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP6zcq/A46NjpXBVqyG7Tuag7/oGP09m6JyCX4S5UME=;
        b=Qz/YyYNoy9Jx9U/q6ZlX0ZWhd/+82bB0PxQhEJncmGPf+MlsGBk0Ctz914Ax0Pxe/L
         D9bKw/BjgfLOQ8Lq0R+ge+9DJgXzYSJdoqw8mJ5XT3MJdsf+ut4RIWTodbYtk3BfK0oo
         7ibW7hPs10MFGtozKbAMWx6JlHdV5+D3LO2n4SCuLgOcjrPDWzBc8GZGg56UmU3kGGQt
         JSVErBhpB0EE//T7jgT+CRrbmF3iYXWOYDA23ogdw7I+/tUnN+/WBDQgFXRUp9Ju9Px8
         u+JI4/22pPL3Y9p7h+0NrSioD3mHS2KC2TvbH6Bz2GedWZeyfPXp20OVmQtzxBY90kIZ
         nUDA==
X-Forwarded-Encrypted: i=1; AHgh+RpWAAHsd2PHMbfnLXAUJ4iiIEg3wmwOeVWHzcIfsJ8ERB3ehq17L66tP1SWrYxNSJenRK3YVuR48lQm@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ2ISmlRxhr+XJHUp1moT/OLz7WpOM3soq4dclvdmJZ4G6ezra
	BZ0AMUCrjxrcAtOUwDq3Y5JvVvzDCF0xdVvD0oadbZTSncgcdfcktsF22Uuw+ejxDZFMhDWwUlu
	1sY07qg==
X-Received: from pjbbf6.prod.google.com ([2002:a17:90b:b06:b0:37d:8595:7a08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2707:b0:366:3ac:f730
 with SMTP id 98e67ed59e1d1-37d160feaa4mr19637357a91.25.1782177890287; Mon, 22
 Jun 2026 18:24:50 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:24:49 -0700
In-Reply-To: <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com> <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
Message-ID: <ajngYb3aNTvtXkwl@google.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 19, 2026, Fuad Tabba wrote:
> nit: why does it have Sean's SoB?

Heh, I had the same question at first.  It's because I tweaked the module param
name to gmem_in_place_conversion, and so updated this patch and sent that version
to Ackerley off-list.  Ackerley's SoB really should come last in this case, even
though it creates a somewhat weird SoB chain given the author.
