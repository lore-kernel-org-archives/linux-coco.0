Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11ED1F4634
	for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374206; cv=pass; b=JaDsko/Jhicj5W4aoehdLYkGHQB9kYd39X989LNpkuTUipKf2LayE4zg6udYSkcHF85AxHkFHxUM6o0++13xN7dK6AfyEe6l6+SkhED2nmvY3psZZcVnYEOTD58/8rV7ljLsMKEoW1kGXpnkyvEPSRK9WrytU89Xxp9ZHLG9UEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374206; c=relaxed/simple;
	bh=WJOUrtquWXGSSgTD5B2FX4mgIruAkhlJJ55ppYaE2UE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLfwjs+P/pW/2l+rfJAg90V8St4jrMJfShvUzUGe4Xpmr43YwHwA+vqe4Z9D2MKBySpEzOFBtqTmY6nyIXwgG3bkhyp0feMxBQLOUK72GYIPMbwaGfmFT3bVTAwpKX6Ux1ZpDyXdFS94CLYTYiv82jOMn8xzuW6z2rMquxybdKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HgMAFsqo; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HgMAFsqo"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-575212eb419so4428599e0c.1
        for <linux-coco@lists.linux.dev>; Thu, 21 May 2026 07:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374204; cv=none;
        d=google.com; s=arc-20240605;
        b=J8+dCY3V4fd/0FdWupkuaqqa+QxXntkndLVkapxeJfiDuWoPQXHaTCaIDH+Y6iRi2w
         xkE/nbWtzjMpElg9760UrP7uYBCp4yTRWPmddEn1BhYBRmF7jI2h5/+2WeE9X5utg5jj
         0RcLV25gSY+2qgdOxTuLboC7jLE36iVzyieWb35yc1FE4hAMD1gZDv6EgaGb2TaKac4B
         VU6ztPa33RdIMuqZK1fosV2Hjpxeyoj36DXFfaf1y5xZTUDKCHwFrzQKNfByPE+Xzpr+
         6FdRpxvTcKBY7XzpAsdAoNUDLy5X10q7MO4reRUELKFmzzqtQjeiAVuuO4Om77ETC30N
         6e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        fh=1oMuZx8WXpUachdtArDqIH1K5lcRGt0e4mPKWpnCPiU=;
        b=Mg0omQDoYUAf6R+TYu7yHoXih1bJFlDBoR7uDrmt9mbKe3rbWCKdAxIQh43gJ+wNlX
         rZwHyKxnPYwNBIct2DarTSulE5E0xhCI8D7K2bUmzEkBUjCJM6iQyEZ4XoGnxho4Qevg
         hTHkrxxVQhUzPvz0waYRRHXfs5PWK/qCY/P43MGnvp4E5TSn95jRhDC4UcL2pcyqvUQa
         Povr8tgD0w36BUVzLUG1WlSPD59FAt0RUfYLogmWn2jQwwu7yuGZYsYzwI3I2sGaisA1
         300DCidN4jr/RD9oDvF2Yz6xFW7ueZNdExizpBI4VUpR2+pq9xLamHXQHxNp4/mcAnuF
         iToQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374204; x=1779979004; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        b=HgMAFsqodMoA3RVcqUBfeOdq2Ze2zOm+9VEVBi7KxtCFG3c/RwAVMW591sVfGaETN4
         0FnFpLKCSZWj74RcoBaZ6nkGmYL8fsNPDli+36UDV5kHey5cRFRMAw4gw354yvfGf36Q
         a6aXEo4wnN8jXRYxU4sOFORjnZyHihnz9jQnBWPSKE0gTyvaWQOeyJFlYcOQAJx78GBi
         h00bQf048B0Fz7psTIa9J0CE4ZO8UE3fdBViyKNMla5QZpAm7KH+6YSMLQLtjEjWw4oP
         LuHIZzMp9sUUH4lOSV7TEUUdzAT+db3PuZepCrLETm72z18J3SscYsl91GZ8odtdRsnh
         vfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374204; x=1779979004;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYaUa4IMCMaYAyZ5spn416wLAd7Y4Wm0XOOfJ/wi8IE=;
        b=MqTdRdIMzj/VFnnzCSISw4JleyeAcORZCMzvJoCPeRXzFvRCu6WUBl55IVY4yuJAeb
         BPZGf3//cqMrQIoIcyS3U/dd2BHwNlKhk6A1yuPvH9tREHEjKLoyp2WPZmdMdrbYxgrD
         0szK+k8Xg3fwVKme9Z9uNt9lykhHVcihJkbmERtO7SJ3Dzxx9JmXlR79SkNr8FYByz73
         DBs9VLsr+sprRnT2BOS4AF3Dz+s1Pi4JiYrjtb0eoGeJmg+9jhBnKeIxhSN6Hj98coYU
         1rMdYkKPrEeY9/F4iYVJp5UM/BbpeXYMjVsQkmkQ33puasqeXxoFO4bPtwFGjcF0h4d8
         1Yug==
X-Forwarded-Encrypted: i=1; AFNElJ+p1IcZ6SE7bOYFDg8ICEf8ZGYE6lwob19eDLrwnj54pc4Q7JM77B4OZP9WXK/8aRG3/b94o+df8mUs@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4EdTZChSamucDRdE3lK5P2K2/mFGZFSY/2oj0yN4M+EYY21A3
	V2OeEL3lDhQ2A+veMayn+3anWAAPflbFqGQLN4AQ3ZsaFAQLF9PVRJC//KeAHEA7NyoF8Vo06rF
	Coc87OZa+Oa/6QmBiGgdPTaa0DQ6+kie0iVCJo48P
X-Gm-Gg: Acq92OHbYeUZBg2DWQltfn/27/Og52VWZsRrXbHlUQ/WTXwP42ZarkqrUdadUaGEJbD
	mUF2cOPqydOjFdJAgBGMpcOoajAz+DH3Ud5TQrm9Aih8xd5vgJ0Rc0dDR9J85E8qgC/zLyOo6VK
	M1pnXUtWZaTqXrRadoFzo5wZWbsPV/OF1M/nZNm1NKMe9DqNj+IZjNdqAJJV5I5WTk/LKVK7ctb
	syvIBcvzanxwjCacd1OSZtu5FK77R6sIqJOoN1s4bhDuZ8CMMGmsjZFgkxwewCpmGgnsNMf45r+
	s8OnX4IUh1qKy309ODuPTOXJIqjCSZ+cm+VfHMjbLuRsLCXwcA==
X-Received: by 2002:ac5:ce81:0:b0:575:a69a:a3c0 with SMTP id
 71dfb90a1353d-58412b0d22amr1255230e0c.7.1779374203234; Thu, 21 May 2026
 07:36:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:36:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:36:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-11-91ab5a8b19a4@google.com> <CA+EHjTyaBpTYsJRRyP09YggoHbi6s-ZgDoWoFgDRxO5k_BkoBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:36:42 -0700
X-Gm-Features: AVHnY4I30lxiEW6e6I5WKrwyQmuhxKDxlslbMLBEy4dCPODuZC6olFnz0j666eA
Message-ID: <CAEvNRgHBwVx+biHxTyNETBt1jQ9Fohshud1N4bt8beVYhPiOKA@mail.gmail.com>
Subject: Re: [PATCH v6 11/43] KVM: guest_memfd: Ensure pages are not in use
 before conversion
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
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
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> +static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>> +                                           size_t nr_pages, pgoff_t *err_index)
>> +{
>> +       struct address_space *mapping = inode->i_mapping;
>> +       const int filemap_get_folios_refcount = 1;
>> +       pgoff_t last = start + nr_pages - 1;
>> +       struct folio_batch fbatch;
>> +       bool safe = true;
>> +       int i;
>> +
>> +       folio_batch_init(&fbatch);
>> +       while (safe && filemap_get_folios(mapping, &start, last, &fbatch)) {
>> +
>> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
>> +                       struct folio *folio = fbatch.folios[i];
>> +
>> +                       if (folio_ref_count(folio) !=
>> +                           folio_nr_pages(folio) + filemap_get_folios_refcount) {
>> +                               safe = false;
>> +                               *err_index = folio->index;
>> +                               break;
>
> https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=11
>

Sashiko's first issue on lru is addressed in a separate patch later. :)

> Sashiko raised a few issues here, but I think this one might be
> genuine. Can you look into it please?
>
> If that's right, when huge page support lands, if start falls in the
> middle of a large folio, returning folio->index as the err_index will
> return an offset strictly less than the requested start. A naive
> userspace retry loop resuming from error_offset would step backwards
> and corrupt attributes on memory it didn't intend to convert.
> err_index should be clamped to max(start, folio->index).
>

For these ones, I was thinking to defer all the huge-page related issues
to be fixed when huge pages land, since there are probably quite a few
places to update.

On second thought, this isn't a huge change, I'll fix this in the next
revision.

> Cheers,
> /fuad
>
>> +                       }
>> +               }
>> +
>>
>> [...snip...]
>>
