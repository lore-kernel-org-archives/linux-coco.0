Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10C2F8EA2
	for <linux-coco@lists.linux.dev>; Tue,  2 Jun 2026 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433173; cv=pass; b=i/lyQFgc3eXGkjSPTD98tZWCkKA0Wglf7EYFh5qqAy3mZ3NIFT0DYbegg0STK1b+FI/7EMIUwqnpqbNXJmUOLZHHKliKCS9I2ynZKOI0otlhF9qqzJgyMAXL1hA+chBHP5pqUo/6+WTdb0Uo8T62bBlglHKHBLax4CTyfs5KZXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433173; c=relaxed/simple;
	bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDTA/xAL64XN591TznDY30oORB6RCKtsYq53gPOOygXlzurivCA6uo4FsC0PLCkEC/2As/1LzCj3R6ZhGGstbfBMJWfaeOolJb6ltUAsamuBljBn6k4zEYEKwuafwwS5P0oBSU7WsTM8Rl2FKORNHz5dXpNli2sp5O/PcGkYJ9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ULvhzBGp; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULvhzBGp"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137335bc3caso10472989c88.0
        for <linux-coco@lists.linux.dev>; Tue, 02 Jun 2026 13:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780433171; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQK8Kv1mRJGmvl8p3aSMO2KPP/11q/eKKHWDVRIEHucPI0M4e5bcjDDYe5YgevXave
         8Zm9x74cqVIr5hzloZj9AFP9zi8gniBGYLFhU4Nrfe/PfH8Xoiki9tCkeGwJuapQUHSQ
         vLO/NT/0yzl68sfMdHFqX3LgZYNl1s8NEGz+XPiBaixgA9qYkFcK3iNzykntDGpKJ3q/
         GF3k/l0jNK2JtHWFoCWwH+Zd9Eqn/CWdQ6QXUkBxDJhptSMtBIiYnkIzWn6Dkkjj0S/M
         goS9k51NhxJGXNW0aQ6Nq4iHSF58VzQU511MBWT7nrRs/DUKUb1hBS2XDwFVEmf9cLnq
         oMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        fh=MEH5A5er5xi58N95WP/xwrXaKzmyA+XmWwCg0TXBrWA=;
        b=iQGFwrr/OMbm6Wf8CVF4NcOahVetfd4GYHS7bTOTl3CO+0d2eHl9If65MxoDlDCnah
         p6WH42hlhWG0q8M/3ST+ujGSRZmZ9cwf0sUPL/0Lf30CERrokiw5Ftc8Y0OFf27ggnLv
         QEac24sIjA3F+PcA4243zw9iBVNuG27GHUris7q6m7AkyZ71gqQhh+JAqgeu4kMCsYSY
         J84d8DxgfwGq4NvRMH5G7r4zsQR8ir/ZP/ZjBa9Vc9abonj/fWjlpQIl546/pRXP+MCY
         FY6VLurUkbhJ5e7USaBeTeMs8u6Nt/bhmFgOyd5D7ZZA33BQ/LlQseZsx+GEteK4ErA7
         n4YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780433171; x=1781037971; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        b=ULvhzBGpZNOckyYguvth4CRJ84HovL4UHESoN8esZF5dViqjhAagosOTUXAOFpL7cq
         MlCnsuWdSYuGb8WeN3jK9b/xxq9UxNf9Tx6PpgTe0ZhByRFWeMuu0/IxSIf7zWcWnhyP
         6AQXUoHfideqUtGwg3V9HFFRBrYo60QULa0GChLmJ8OBEqsTVvlYzR1QlXE3QtYwLRuA
         1rH0YiHv1DbnAI4V8YiqOmnavpM0Sb7hKbSnAP/imQT5Zpp329asUCx7gk8wnaCmT2hz
         UvrvhcuUe1+sZAHfgDzcdTt0nz+tuGiholOPupXeBLsivzmJv80rJ9FWP81rXKIOsNsT
         M11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433171; x=1781037971;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fn/J8d++vhy7/fERHcDXvB1WBDLFupuHbck0qB3MoMg=;
        b=K0NbnZ25zft5LLNTIkxLLxq2SlDwacsQmlLs2cRi1TpxQzNqUyFfk7A7aNL43cAB7L
         D3492uBa8WwGzrCL++QWM5DX/RhPLsY/bu3C3YuMcaTmiSJCfV3iYuHgt2ad4j+tqTFh
         IET+huLjMTkigC0UXUPFEh+8vAVNRSjz7aoYtVQVAAK8jVuhU5WbqoMakmAG1m2F0C47
         Wq5pvkFCVO8K8vieu1QV8ApIAOuna033R4+Ie9jKO53u/4Y+Mur3n/052WV2rFJsl7XL
         DGiWyU1dGS3Q0IS9Cl/xi+CthZvhWBgJ6hJwEomTe9dost/EiD7vM/hu61iP8uDpY7us
         E3xg==
X-Forwarded-Encrypted: i=1; AFNElJ/RY0cbYBtW1l9Xg8n8VigHuJEfkFbE4NDZcVlGNJIIkBLK//qZCIFA20Jt5aJJGgbvDoiMo4O/bxtV@lists.linux.dev
X-Gm-Message-State: AOJu0Yza9qpH0FJYeYCCyEbfNpUo1nbGEizMOEYB3nb/1iEOf2fPe0fH
	plT9LZrR+Lz9LDCN3zFSx932C5N4G+gLR3158nzvO6e1dwoOYO+soATwJB5ttXL44LgY3Yb8vKJ
	QJzDLQ7URqiui2mJVOAiadbMHTMluV/NwGWSL9P05
X-Gm-Gg: Acq92OF48sOZRBfiz7nZcGryWAfPCndoXZnnBveqILYcxL92WEuzPJPJ4NyygJjmPhn
	879DWiESCusTWnj2aHeAZ4dmbaNra0MNzc1qP1Aq9XWfBLjnQF4mEeEept4hWViM6oC9Ik14owm
	9cKX/rmxCjTpww5GkZCkItl5U7z2qGs4lCYJLxceh4HUHEbu0snh89NSp3dev30zrWx+iWHuuxm
	gZMl3UjW1q16ZvoeZnO5GEbxPGzn7unkSKBcLE7E84IF7KrmjHW5nc0Drt72ejTlWUCcLMfzAQ9
	SlEvf5HMwBAs1keDdJGNMoWnCE7fgAVMW2VZ2ruD1k4bWu6Fkcfcc2K52Bkp5HdfucDUApPpaQL
	sDyF1jIqKshgUBEc=
X-Received: by 2002:a05:7022:ec86:b0:128:d7a7:5271 with SMTP id
 a92af1059eb24-137f6bf3cd0mr110847c88.28.1780433170429; Tue, 02 Jun 2026
 13:46:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:46:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 13:46:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com> <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 2 Jun 2026 13:46:09 -0700
X-Gm-Features: AVHnY4LuAokUCPsMDhhGv1NZjrPxAfRb9eFwDvC0vBskqE74-aUqfHm3K8vBqpY
Message-ID: <CAEvNRgGzOnA34WyOHtkOx5MZDZhOHaXAe+nD75AiJsZ-PsTSFQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: Suzuki K Poulose <suzuki.poulose@arm.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> On 23/05/2026 01:17, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> All-shared guest_memfd used to be only supported for non-CoCo VMs where
>> preparation doesn't apply. INIT_SHARED is about to be supported for
>> non-CoCo VMs in a later patch in this series.
>
> nit: s/non-CoCo/CoCo ?
>

Yes, thanks!

>>
>> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
>> guest_memfd in a later patch in this series.
>>
>> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
>> shared folio for a CoCo VM where preparation applies.
>>
>> Add a check to make sure that preparation is only performed for private
>> folios.
>>
>> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
>> conversion to shared.
>>
>> Signed-off-by: Michael Roth <michael.roth@amd.com>
>
> nit: Missing Co-Developed-by: ?
>

IIRC this should have been

Suggested-by: Michael Roth <michael.roth@amd.com>

IIRC Michael suggested this on one of the guest_memfd calls, Michael
please let me know if you remember otherwise!

>>
>> [...snip...]
>>
