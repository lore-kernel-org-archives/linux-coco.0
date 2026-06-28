Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BCF299937
	for <linux-coco@lists.linux.dev>; Sun, 28 Jun 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782642802; cv=none; b=mzKxmldLHJQZRB1H0TKWJmYyyMobxNmaszIc6LMjuOtoQFO2ztCugXZ6vXZbgPTPOOdF7fEozUMoqviDoLog24pcBcMCmot11OYDPPgmcdkNBlNALisWPxoozr35KYPl9CndKH3RL1sNASg82oD9piv8j+87wPZUFGlgIWn+Tik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782642802; c=relaxed/simple;
	bh=VHNkDH4VjuRT0QCmZIOW/Ua4l6niAp3NDBK61hkeo7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mULQ1ZYF9VS7G3oMiaryjYmmBn/SkxPE5EyqMkHDiKcOl6rCHxZbDYf6d6xMbL75RLuOiNbrwIxNE/oLJYu9DmAcWW8TDf0QgKOgaI8kBwsQEbmgT2a4s9NkTz6qSBaytfMTAl+UEYs0WUrhhDNSLc4qwCmsW1EDi5O//+RBZHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L3KkygyB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L3KkygyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782642799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L6kqgIhL4Q7IX2UVOE7aXrWfjRzn/Mkd4Vh+0BWZkPk=;
	b=L3KkygyBzj0BsoDgdKjcPfBT5Hk5wVdobapSJDsZEaF0Z8MRPSaOzywdxDtK73GKH1T/0i
	sPttTv0SpjHC+oDfPQr/SK/mSQa0zT6GX1mkuyWeckHDQ6Wy/Jnf9OhukvYR4Fu561cN1Z
	GRpUfoVKgWqWJU4ULxHQVG26UR8PjtI=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-PDGspVR0MViEHpb0T1Rvng-1; Sun, 28 Jun 2026 06:33:17 -0400
X-MC-Unique: PDGspVR0MViEHpb0T1Rvng-1
X-Mimecast-MFC-AGG-ID: PDGspVR0MViEHpb0T1Rvng_1782642796
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c17f62afdso2158475eec.0
        for <linux-coco@lists.linux.dev>; Sun, 28 Jun 2026 03:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782642796; x=1783247596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6kqgIhL4Q7IX2UVOE7aXrWfjRzn/Mkd4Vh+0BWZkPk=;
        b=hIKC3SDJz4/+Qn9HDgFnnJcGFthOhjvPqqqUGhzsQIW8wmwEhzW/TDmzh4MVi6kWc5
         DgUb81njmjjLgU1aXztjl0i1PQS3PITAVpf4IizfQiw2jUteZ+xuUj+z4zlSInAgk5S2
         juO5+NBRHtJalkIMOZkW0dTA1W0QQkBXY0xGK4bAagtR+7FBcIq0T+2rI+7zadnMswdE
         ZcUZC7pwbXoK4+/BKotnJ/9zjpowBC7vtNXofqnxP/Kdb1vzzHNg9pn+i4PlYgIgJf0y
         6guhr40vdmgDdSlqsfLG3t9O3/Qu2oLAjjBib0IU0+0E55QRYIuzyexmcHgVyJOiw7qo
         /MmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4RrmvbBN3nPcXJO4ssi2QaRRKmkqXcOD1/mxmwBo12KDcDO//TWhaXsUawsFFvulIdmSJ3NZmzAHk@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4PT9V5NPkfKYXP8l3CroIyNrp3OmkzBF9BRGIyQ+jfM8YmHZk
	t3OYJtiu18E1xQDqqiX4RFer5cG4/Ro2jNstKA9uXkYAcP9Pso4XzhTrGGndpu1Ka9ceIPSCBMm
	czUmX2WUzVPLXA7uBiPyf8yr8Z0YQG/7SdaMZ4h1W4EperWxpXmc8DUY8mo64mHY=
X-Gm-Gg: AfdE7cnu9gd86XiQVvZ86/ztzx9Uco4kexAJdtgJ0sMuuM46zKHJFjXE5qk7J8yyuR0
	Eh5FFdjz/r0etBI5kxxScsQIA9RVsEyYB9KCxdBkFLsE4XAAyaZUJD4VF6yV1/8KXNPEDbADClx
	q3QpyS6qke0sXiU9pUhM0a685JfcI2EeoZRNNffd1tHszg+n4EzEEul7JDpk5xCBd0C0ziA2iXy
	rV9HfBJgfEq7FCXyueVOAHmwNzkFqeYMQHmcqfMa0cgeGlFMUwhA5VHgLf8UAnkcnCQOX3o2rxP
	YJ2krSyGTF8/WDReFKCEPI8Otz9TGLAKUh5+ly00j2eKhPyW0q2ZwqiY1ekfxv1CWg7l/CCXN6b
	Nlq/Uw0enPrWq+bKP4lHSFK4dIK1wEjPlU7OhXejZgxkrFWwIe2Qgpw==
X-Received: by 2002:a05:7300:a49a:b0:30c:b63e:bb8e with SMTP id 5a478bee46e88-30cb63ef7b3mr4959169eec.20.1782642796135;
        Sun, 28 Jun 2026 03:33:16 -0700 (PDT)
X-Received: by 2002:a05:7300:a49a:b0:30c:b63e:bb8e with SMTP id 5a478bee46e88-30cb63ef7b3mr4959126eec.20.1782642795511;
        Sun, 28 Jun 2026 03:33:15 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ab6sm58771923eec.15.2026.06.28.03.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 03:33:12 -0700 (PDT)
Message-ID: <901398bb-ed6c-4997-b3cd-ce2829b09c87@redhat.com>
Date: Sun, 28 Jun 2026 20:33:01 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/44] arm64: RMI: Runtime faulting of memory
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve
 <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-30-steven.price@arm.com>
 <3359f788-07fa-41a1-9ac7-45c58577c1fa@redhat.com>
 <aiJ6u83O0nVUtPyv@lpieralisi>
 <ecef952b-e8c6-4102-933b-c99c46f14431@redhat.com>
 <aiLes2ecZSr17UwZ@lpieralisi>
 <1e39094f-7fa3-4ef1-be54-53d7a8643506@redhat.com>
 <98d2a0f3-b831-466a-8212-5bcf97ad9d8b@arm.com>
 <8da87878-2a5d-478a-a280-60dbed7ad1b9@redhat.com>
 <9482dfbc-4d96-47ba-a615-f4ba0bda833f@arm.com>
 <8f81ed99-c53a-4196-baa2-adea9239a000@redhat.com>
 <aj6sdzlbxT8D5fnf@lpieralisi>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aj6sdzlbxT8D5fnf@lpieralisi>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rJFE2Oz0-joP0I8LrNe6Og_CpWSe9gVfuue_pLzm8JQ_1782642796
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/26 2:44 AM, Lorenzo Pieralisi wrote:
> On Fri, Jun 26, 2026 at 09:43:03PM +1000, Gavin Shan wrote:
>> On 6/26/26 6:47 PM, Suzuki K Poulose wrote:
>>> On 26/06/2026 08:43, Gavin Shan wrote:
>>>> On 6/26/26 1:58 AM, Suzuki K Poulose wrote:
>>>>> On 25/06/2026 14:53, Gavin Shan wrote:
>>>>>> On 6/6/26 12:35 AM, Lorenzo Pieralisi wrote:
>>>>>>> On Fri, Jun 05, 2026 at 06:11:11PM +1000, Gavin Shan wrote:
>>>>>>>> On 6/5/26 5:28 PM, Lorenzo Pieralisi wrote:
>>>>>>>>> On Fri, Jun 05, 2026 at 04:23:15PM +1000, Gavin Shan wrote:
>>>>
>>>> [...]
>>>>
>>>>>>>>
>>>>>>>> I tried to rebase Jean's latest QEMU series [1] to upstream QEMU, and found
>>>>>>>> that memory slots backed by THP are broken. With THP disabled on the host and
>>>>>>>> other fixes (mentioned in my prevous replies) applied on the top of this (v14)
>>>>>>>> series, I'm able to boot a realm guest with rebased QEMU series [2], plus more
>>>>>>>> fxies on the top.
>>>>>>>>
>>>>>>>> [1] https://git.codelinaro.org/linaro/dcap/qemu.git  (branch: cca/ latest)
>>>>>>>> [2] https://git.qemu.org/git/qemu.git                (branch: cca/ gavin)
>>>>>>>>
>>>>>>>> Lorenzo, You may be saying there is someone making QEMU to support ARM/CCA?
>>>>>>>
>>>>>>> Mathieu and I are working on that yes and with Steven/Suzuki to fix the THP
>>>>>>> issues you pointed out above.
>>>>>>>
>>>>>>>> If so, I'm not sure if there is a QEMU repository for me to try?
>>>>>>>
>>>>>>> We should be able to submit patches by end of June - we shall let you know
>>>>>>> whether we can make something available earlier.
>>>>>>>
>>>>>>
>>>>>> Not sure if there are other known issues in this series. It seems the stage2
>>>>>> page fault handling on the shared space isn't working well. In my test, the
>>>>>> vring (struct vring_desc) of virtio-net-pci is updated by the guest, and the
>>>>>> data isn't seen by QEMU, I'm suspecting if the host-page-frame-number is properly
>>>>>> resolved in the s2 page fault handler for shared (unprotected) space.
>>>>>>
>>>>>> - I rebased Jean's latest qemu branch to the upstream qemu;
>>>>>>
>>>>>> - On the host, which is emulated by qemu/tcg, the THP (transparent huge page) is
>>>>>>     disabled.
>>>>>>
>>>>>> - On the guest, I can see the virtio vring (struct vring_desc) is updated. The
>>>>>>     S1 page-table entry looks correct because the corresponding physical address
>>>>>>     0x10046880000 is a sane shared (unprotected) space address.
>>>>>>
>>>>>>     [   52.094143] software IO TLB: Memory encryption is active and system is using DMA bounce buffers
>>>>>>     [   52.289746] virtqueue_add_desc_split: desc[0]@0xffff000006880000, [00000100b983f000  00000640  0002  0001]
>>>>>>     [   52.432150] PTE 0x00e8010046880707 at address 0xffff000006880000
>>>>>>
>>>>>> - On the host, the s2 page-table-entry is unmapped due to attribute transition (private -> shared).
>>>>>>     A subsequent S2 page fault is raised against the adress and the s2 page-table-entry is built.
>>>>>>
>>>>>>     [  109.259077] ====> realm_unmap_shared_range: tracked_unprot_addr=0x10046880000
>>>>>>     [  109.260249] realm_unmap_shared_range: unmapped shared range at 0x10046880000
>>>>>>     [  109.317786] realm_unmap_shared_range: unmapped shared range at 0x10046880000
>>>>>>     [  109.629939] ====> kvm_handle_guest_abort: fault_ipa=0x10046880000, esr=0x92000007
>>>>>>     [  109.630245] realm_map_non_secure: ipa=0x10046880000, pfn=0xb8b59, size=0x1000, prot=0xf
>>>>>>     [  109.630331] realm_map_non_secure: ipa=0x10046880000, ipa_top=0x10046881000, flags=0x1e0001, range_desc=0xb8b59004
>>>>>
>>>>> Are you able to correlate the order of the transitions and the Guest
>>>>> access with RMM log ? We haven't seen this from our end. We are aware
>>>>> of permission fault issues with Unprotected IPA when backing the memslot
>>>>> with MAP_PRIVATE areas. But this looks different.
>>>>>
>>>>> Lorenzo, have you run into this ?
>>>>>
>>>>
>>>> It's hard to correlate the order since the logs are collected from two separate
>>>> consoles. For the write permission, I add code to the host where the permission
>>>> is always added for all s2 page faults in the shared space. Otherwise, qemu can
>>>> be killed by -EFAULT or similar error.
>>>
>>> This is the problem. We can't add WRITE permission by default. I believe
>>> you may have MAP_PRIVATE mapping and it has to be mapped as READ only
>>> and on a permission fault, we replace it with a writable page. By
>>> overriding the WRITE permission, you let the guest write to a page
>>> that may not be seen by the VMM.
>>>
>>> We identified this as a bug in the KVM driver in this series (reported
>>> by Lorenzo) and there is a corresponding tf-RMM change that is required
>>> to get this working. So, please could you wait until the next series
>>> when this will be addressed ? Or you could switch to using MAP_SHARED
>>> for the "shared" memory in the memslot.
>>>
>>
>> Exactly. the syntax for MAP_PRIVATE is broken if the write permission is
>> enforced for a read fault in the shared space. In my case, the host page can
>> be the zero page and eventually multiple s2 page-table entries (for multiple
>> unprotected or shared pages) point to the zero page. It's why clearing the
>> 3rd queue (Ctrl queue) also clears the first queue (Rx queue) in my case.
>>
>> Yes, this issue can be avoid by using a shared memory backend in qemu, something
>> like below. With this, I'm able to see virtio-net-pci starts to work...
>>
>>      -object memory-backend-ram,id=mem0,size=2G,share=yes
> 
> Yes, as Suzuki said that's what we have been fixing. QEmu patches
> will be on the mailing lists very shortly - the KVM/tf-RMM fixes
> to make MAP_PRIVATE work will be included in the next posting.
> 
> Feel free to drop your QEmu command line so that I can give it
> a shot and check whether the fixes solve the problem you hit
> (I think so because that's precisely the kind of issue I got
> into when I started debugging THP/MAP_PRIVATE but it is better
> to check).
> 

The virtio-net-pci doesn't work with the following command lines. The guest
kernel image is built from upstream kernel (v7.1.rc7).

     qemu-system-aarch64 -enable-kvm -object rme-guest,id=rme0,             \
     -machine virt,gic-version=3,confidential-guest-support=rme0            \
     -cpu host,pmu=off                                                      \
     -smp maxcpus=2,cpus=2,sockets=1,clusters=1,cores=1,threads=2           \
     -m 2G -object memory-backend-ram,id=mem0,size=2G                       \
     -numa node,nodeid=0,cpus=0-1,memdev=mem0                               \
     -serial mon:stdio -monitor none -nographic -nodefaults                 \
     -kernel /mnt/linux/arch/arm64/boot/Image                               \
     -initrd /mnt/buildroot/output/images/rootfs.cpio.xz                    \
     -append earlycon=pl011,mmio,0x10009000000                              \
     -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                  \
     -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                  \
     -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                  \
     -device pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4                  \
     -netdev tap,id=tap1,vhost=on,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
     -device virtio-net-pci,bus=pcie.2,netdev=tap1,mac=b8:3f:d2:1d:3e:c0

The virtio-net-pci starts to work with the shareable memory-backend.

     -object memory-backend-ram,id=mem0,size=2G,share=yes

Note that THP is disabled on my host.

     root@host:~# cat /sys/kernel/mm/transparent_hugepage/enabled
     always madvise [never]

Thanks,
Gavin

> Thanks,
> Lorenzo
> 

